import AWSClientRuntime
@preconcurrency import AWSS3
import AWSSDKIdentity
import CoreImage
import Foundation
import HTTP
import Logger
import ImageLoader
import MediaModel
import SensitiveContentAnalysis
import UIKit

public final actor DefaultMediaClient: MediaClient {
    private let httpClient: any HTTP.HTTPClient
    private let imageLoader: any ImageLoader
    private var r2Configuration: R2Configuration?
    private var s3Client: S3Client?
    private let encoder: JSONEncoder

    public init(
        httpClient: any HTTP.HTTPClient,
        imageLoader: any ImageLoader,
        encoder: JSONEncoder,
    ) {
        self.httpClient = httpClient
        self.imageLoader = imageLoader
        self.encoder = encoder
    }
}

extension DefaultMediaClient {
    public func upload(
        media: MediaUpload
    ) async throws -> MediaAttachment {
        switch media.uploadType {
        case .giphy(let giphyMedia):
            let form: UploadGiphyMediaRequest.Form = .init(
                uploadStarted: media.uploadStarted,
                clientID: media.clientID,
                giphyMedia: .init(
                    giphyID: giphyMedia.giphyID,
                    giphyURL: giphyMedia.giphyURL
                )
            )
            let request: UploadGiphyMediaRequest = .init(
                form: form,
                encoder: encoder,
            )
            return try await httpClient.send(request)
            
        case .image(let uiImage):
            let imageURL: URL = try await upload(image: uiImage)
            let form: UploadImageMediaRequest.Form = .init(
                uploadStarted: media.uploadStarted,
                clientID: media.clientID,
                photoMedia: .init(imageURL: imageURL)
            )
            let request: UploadImageMediaRequest = .init(
                form: form,
                encoder: encoder,
            )
            return try await httpClient.send(request)
        }
    }
}

// MARK: - Upload Images
extension DefaultMediaClient {
    private func setupImageUploaderIfNeeded() async throws {
        guard r2Configuration == nil || s3Client == nil else {
            return
        }
        // Cloudflare R2 credentials for pokerface bucket
        // TODO: Replace
        let accountId = "65cf262b9b822b7ead823fddfa5435e1"
        let accessKeyId = "fd6a69b608bddfaea676aa8fc858615e"
        let secretAccessKey = "0be9fb346efebbcc1bc7051d48a5b8737b559bd96c8232f9546c1d93dc9ce4fd"
        let bucketName = "pokerface"
        let publicUrl = "https://pub-f02a5af91b4f47e9ac7cddf423e0d781.r2.dev"
        // let publicUrl = "https://images.queen3.app" // Uncomment when custom domain is ready
        
        let r2Config = R2Configuration(
            accountId: accountId,
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            bucketName: bucketName,
            publicUrl: publicUrl
        )
        self.r2Configuration = r2Config
        
        // Configure AWS S3 client for R2
        let credentials = AWSCredentialIdentity(
            accessKey: accessKeyId,
            secret: secretAccessKey,
            sessionToken: nil
        )
        let credentialsProvider = StaticAWSCredentialIdentityResolver(credentials)
        
        let endpoint = "https://\(accountId).r2.cloudflarestorage.com"
        
        let s3Configuration = try await S3Client.S3ClientConfiguration(
            awsCredentialIdentityResolver: credentialsProvider,
            region: "us-east-1", // Required but not used with R2
            endpoint: endpoint
        )
        
        self.s3Client = S3Client(config: s3Configuration)
    }
    
    public func upload(image: UIImage) async throws -> URL {
        try await setupImageUploaderIfNeeded()

        guard let config = r2Configuration,
              let s3Client = s3Client
        else {
            throw ImageUploadError.invalidR2Credentials
        }
        
        guard let jpegData: Data = try await downscale(
            image: image,
            toMaxSide: 512
        ).jpegData(compressionQuality: 0.8) else {
            throw ImageUploadError.failedToConvertToPNGData
        }
        
        let fileName = "\(UUID().uuidString).jpg"
        let objectKey = "images/\(fileName)"
        
        do {
            let putObjectRequest = PutObjectInput(
                body: .data(jpegData),
                bucket: config.bucketName,
                contentType: "image/jpeg",
                key: objectKey
            )
            
            let response = try await s3Client.putObject(input: putObjectRequest)
            logIt(.debug, "R2 upload successful: \(response)")
            
            // Return the public URL
            let publicUrl = "\(config.publicUrl)/\(objectKey)"
            guard let finalUrl = URL(string: publicUrl) else {
                throw ImageUploadError.failedToCreateURL
            }
            
            // we're likely to immediately display it
            try await imageLoader.cache(
                image: image,
                url: finalUrl
            )
            
            return finalUrl
            
        } catch {
            logIt(.error, "Failed to upload image to R2", error: error)
            throw ImageUploadError.r2UploadFailed
        }
    }
    
//    private func checkForBadContentIfNeeded(image: UIImage) async throws {
//        let analyzer: SCSensitivityAnalyzer = .init()
//        switch analyzer.analysisPolicy {
//        case .disabled:
//            return
//            
//        case .simpleInterventions, .descriptiveInterventions:
//            guard let cgImage: CGImage = image.cgImage else {
//                return
//            }
//            let result: SCSensitivityAnalysis = try await analyzer.analyzeImage(cgImage)
//            if result.isSensitive {
//                throw ImageUploadError.contentNotPermitted
//            }
//            
//        @unknown default:
//            return
//        }
//    }
    
    public func downscale(
        image: UIImage,
        toMaxSide maxSide: CGFloat
    ) async throws -> UIImage {
        // TODO: use Nuke's downscaling
        if maxSide >= image.size.width && maxSide >= image.size.height {
            return image
        }
        let size: CGSize = image.size
        let aspectRatio: CGFloat = size.width / size.height
        var newSize: CGSize
        if size.width > size.height {
            newSize = CGSize(
                width: maxSide,
                height: maxSide / aspectRatio
            )
        } else {
            newSize = CGSize(
                width: maxSide * aspectRatio,
                height: maxSide
            )
        }
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        return scaledImage
    }
}

private struct R2Configuration {
    let accountId: String
    let accessKeyId: String
    let secretAccessKey: String
    let bucketName: String
    let publicUrl: String
}
