import Foundation

extension AddLinkView {
    struct Model: Sendable {
        var linkString: String
        let isPresentedModally: Bool
        let didAddLink: @MainActor @Sendable (URL) -> Void
        var url: URL? { URL(string: linkString) }
    }
}

extension AddLinkView.Model {

}
