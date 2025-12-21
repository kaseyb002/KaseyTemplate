import Foundation

public struct AddLinkViewRequiredData {
    let mode: Mode
    let didAddLink: @MainActor @Sendable (URL) -> Void
    
    public enum Mode {
        case add
        case edit(URL)
        
        var linkString: String {
            switch self {
            case .add:
                ""
                
            case .edit(let url):
                url.absoluteString
            }
        }
    }
    
    public init(
        mode: Mode,
        didAddLink: @MainActor @Sendable @escaping (URL) -> Void
    ) {
        self.mode = mode
        self.didAddLink = didAddLink
    }
}
