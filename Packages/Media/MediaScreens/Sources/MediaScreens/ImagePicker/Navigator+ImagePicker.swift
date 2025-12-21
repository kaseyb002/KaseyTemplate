import MediaModel
import UtilityModel
import UIKit

extension Navigator {
    public func presentImagePicker(
        requiredData: ImagePickerRequiredData,
        on presentingViewController: UIViewController
    ) {
        imagePickerDelegate.didSelectImage = requiredData.didSelectImage
        switch requiredData.selectedOption {
        case .camera:
            loadPicker(
                sourceType: .camera,
                presentFrom: presentingViewController
            )

        case .library:
            loadPicker(
                sourceType: .photoLibrary,
                presentFrom: presentingViewController
            )
            
        case .prompt(let sourceView):
            let cameraAction: UIAlertAction = .init(
                title: "Camera"
            ) {
                loadPicker(
                    sourceType: .camera,
                    presentFrom: presentingViewController
                )
            }
            let myPhotosAction: UIAlertAction = .init(
                title: "My Photos"
            ) {
                loadPicker(
                    sourceType: .photoLibrary,
                    presentFrom: presentingViewController
                )
            }
            let actionSheet: ActionSheetModel = .init(
                title: requiredData.promptTitle,
                sourceView: sourceView,
                actions: [
                    myPhotosAction,
                    cameraAction,
                ]
            )
            guard let navigationController = presentingViewController as? UINavigationController else {
                return
            }
            didSelectNavAction(.actionSheet(actionSheet), navigationController)
        }
    }
    
    private func loadPicker(
        sourceType: UIImagePickerController.SourceType,
        presentFrom presentingViewController: UIViewController
    ) {
        let picker = makeImagePicker(
            sourceType: sourceType
        )
        imagePickerDelegate.imagePicker = picker
        presentingViewController
            .present(
                picker,
                animated: true,
                completion: nil
            )
    }
    
    private func makeImagePicker(
        sourceType: UIImagePickerController.SourceType
    ) -> UIImagePickerController {
        let picker: UIImagePickerController = .init()
        picker.delegate = imagePickerDelegate
        picker.sourceType = sourceType
        picker.allowsEditing = true
        return picker
    }
}
