import Colors
import SwiftUI

public struct MenuSectionView<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        Group(subviews: content) { views in
            ForEach(views) { view in
                row(
                    view: view,
                    isFirst: view.id == views.first?.id,
                    isLast: view.id == views.last?.id,
                )
            }
        }
    }
    
    public init(
        @ViewBuilder content: () -> Content,
    ) {
        self.content = content()
    }
}

// MARK: - Subviews
extension MenuSectionView {
    private func row(
        view: SubviewsCollection.Element,
        isFirst: Bool,
        isLast: Bool,
    ) -> some View {
            
        if view.id == views.last?.id {
            
        }
    }
}
