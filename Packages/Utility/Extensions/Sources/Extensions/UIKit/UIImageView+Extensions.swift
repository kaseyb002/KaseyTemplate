import CoreImage.CIFilterBuiltins
import UIKit

extension UIImage {
    public static func qrCode(from string: String) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.correctionLevel = "H"
        filter.message = Data(string.utf8)
        
        guard let outputImage: CIImage = filter.outputImage,
              let cgImage: CGImage = context.createCGImage(
                outputImage,
                from: outputImage.extent
              )
        else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
