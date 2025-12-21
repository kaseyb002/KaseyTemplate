import Nuke
import NukeUI
import SwiftUI

extension LazyImage {
    public func applyImageResizing(
        contentMode: ImageProcessingOptions.ContentMode
    ) -> some View {
        GeometryReader { geometry in
            self
                .processors(
                    [
                        ImageProcessors
                            .Resize(
                                size: geometry.size,
                                contentMode: contentMode
                            )
                    ]
                )
        }
    }
}
