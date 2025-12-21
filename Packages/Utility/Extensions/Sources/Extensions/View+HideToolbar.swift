import SwiftUI

extension Backport where Content: View {
    @ViewBuilder public func hideNavigationBarHairline() -> some View {
        if #available(iOS 18, *) {
            content.toolbarBackground(.hidden, for: .navigationBar)
        } else {
            content
        }
    }
}
