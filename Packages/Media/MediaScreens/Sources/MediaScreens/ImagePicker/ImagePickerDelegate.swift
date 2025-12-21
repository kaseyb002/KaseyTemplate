import UIKit

final class ImagePickerDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagePicker: UIImagePickerController?
    var didSelectImage: ((UIImage) -> ())?
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        didSelectImage?(image)
        imagePicker?.dismiss(animated: true, completion: nil)
    }
}
