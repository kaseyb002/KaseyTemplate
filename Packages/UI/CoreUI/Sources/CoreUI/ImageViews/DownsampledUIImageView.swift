import SwiftUI
import ImageIO
import UniformTypeIdentifiers

// MARK: - Tiny cache (thread-safe)
private actor _DownsampleCache {
    static let shared = _DownsampleCache()
    private var store: [String: UIImage] = [:]
    func get(_ key: String) -> UIImage? { store[key] }
    func set(_ key: String, _ image: UIImage) { store[key] = image }
}

// MARK: - Helpers
private enum Downsample {
    static func maxPixelSize(for pointSize: CGSize, scale: CGFloat) -> CGFloat {
        max(pointSize.width, pointSize.height) * scale
    }
    static func key(cacheKey: String, pixelSize: CGFloat) -> String {
        "\(cacheKey)::\(Int(pixelSize.rounded()))"
    }

    /// Re-encodes a UIImage to Data so ImageIO can handle orientation + transform.
    /// JPEG is usually fine; tweak `quality` if desired.
    static func encode(_ image: UIImage, quality: CGFloat = 0.92) throws -> Data {
        if let data = image.jpegData(compressionQuality: quality) {
            return data
        }
        // Fallback if JPEG isn’t available
        guard let cg = image.cgImage,
              let data = CFDataCreateMutable(nil, 0),
              let dest = CGImageDestinationCreateWithData(
                data,
                UTType.png.identifier as CFString,
                1,
                nil
              ) else {
            throw NSError(domain: "Downsample", code: -10, userInfo: [NSLocalizedDescriptionKey: "Failed to encode image"])
        }
        CGImageDestinationAddImage(dest, cg, nil)
        guard CGImageDestinationFinalize(dest) else {
            throw NSError(domain: "Downsample", code: -11, userInfo: [NSLocalizedDescriptionKey: "Finalize encode failed"])
        }
        return data as Data
    }

    static func downsample(from data: Data, maxPixelSize: CGFloat) throws -> UIImage {
        let srcOptions: CFDictionary = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let src = CGImageSourceCreateWithData(data as CFData, srcOptions) else {
            throw NSError(domain: "Downsample", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not create image source"])
        }
        let opts: CFDictionary = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,   // respects EXIF orientation
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixelSize
        ] as CFDictionary

        guard let cg = CGImageSourceCreateThumbnailAtIndex(src, 0, opts) else {
            throw NSError(domain: "Downsample", code: -2, userInfo: [NSLocalizedDescriptionKey: "Could not create thumbnail"])
        }
        return UIImage(cgImage: cg, scale: 3, orientation: .up)
    }
}

// MARK: - View
/// Geometry-aware, off-main downsampling from a `UIImage`
public struct DownsampledUIImageView: View {
    public enum Phase { case empty, success(UIImage), failure(Error) }

    private let sourceImage: UIImage
    /// Provide a stable id for this logical image (file path, DB id, hash, etc.)
    private let cacheKey: String
    private let contentMode: ContentMode
    private let placeholder: AnyView?
    private let onFailure: ((Error) -> Void)?

    @State private var phase: Phase = .empty

    public init(
        image: UIImage,
        cacheKey: String,
        contentMode: ContentMode = .fit,
        placeholder: (() -> any View)? = nil,
        onFailure: ((Error) -> Void)? = nil
    ) {
        self.sourceImage = image
        self.cacheKey = cacheKey
        self.contentMode = contentMode
        self.placeholder = placeholder.map { AnyView($0()) }
        self.onFailure = onFailure
    }

    public var body: some View {
        GeometryReader { geo in
            content(geo: geo)
                .task(id: taskID(for: geo.size)) {
                    await load(for: geo.size)
                }
        }
    }

    @ViewBuilder
    private func content(geo: GeometryProxy) -> some View {
        switch phase {
        case .empty:
            placeholder ?? AnyView(Color.clear)
        case .success(let ui):
            Image(uiImage: ui)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        case .failure:
            placeholder ?? AnyView(Color.clear)
        }
    }

    private func taskID(for size: CGSize) -> String {
        let px = Int(Downsample.maxPixelSize(for: size, scale: UIScreen.main.scale).rounded())
        return "\(cacheKey)::\(px)"
    }

    private func load(for size: CGSize) async {
        let maxPx = Downsample.maxPixelSize(for: size, scale: UIScreen.main.scale)
        guard maxPx > 0 else { return }

        let sizeKey = Downsample.key(cacheKey: cacheKey, pixelSize: maxPx)

        if let cached = await _DownsampleCache.shared.get(sizeKey) {
            await MainActor.run { phase = .success(cached) }
            return
        }

        do {
            let thumb = try await Task.detached(priority: .utility) { () -> UIImage in
                if Task.isCancelled { throw CancellationError() }
                // Encode (once) so ImageIO can properly transform & downsample
                let data = try Downsample.encode(sourceImage)
                return try autoreleasepool {
                    try Downsample.downsample(from: data, maxPixelSize: maxPx)
                }
            }.value

            await _DownsampleCache.shared.set(sizeKey, thumb)
            await MainActor.run { phase = .success(thumb) }
        } catch {
            await MainActor.run {
                phase = .failure(error)
                onFailure?(error)
            }
        }
    }
}
