import UIKit

public struct ImagePickerRequiredData: Sendable {
    public let promptTitle: String
    public let selectedOption: SelectedOption
    public let didSelectImage: @MainActor @Sendable (UIImage) -> Void
    
    public enum SelectedOption: Sendable {
        case camera
        case library
        // TODO: get rid of this option. leave this prompt to SwiftUI
        // create a common View+Extension if needed
        case prompt(sourceView: UIView)
    }
    
    public init(
        promptTitle: String,
        selectedOption: SelectedOption,
        didSelectImage: @MainActor @Sendable @escaping (UIImage) -> Void
    ) {
        self.promptTitle = promptTitle
        self.selectedOption = selectedOption
        self.didSelectImage = didSelectImage
    }
}
