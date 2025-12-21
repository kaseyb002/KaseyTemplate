import SwiftUI

public struct DragModifier: ViewModifier {
    @State private var offset: CGSize = .zero
    @State private var globalFrame: CGRect = .zero
    private var globalFrameWithOffsetApplied: CGRect {
        return CGRect.init(
            x: globalFrame.origin.x + offset.width,
            y: globalFrame.origin.y + offset.height,
            width: globalFrame.width,
            height: globalFrame.height
        )
    }
    private let onDragChanged: ((CGRect) -> Void)?
    private let onDragEnded: ((CGRect) -> Void)?
    
    public func body(content: Content) -> some View {
        content
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = CGSize(
                            width: value.translation.width,
                            height: value.translation.height
                        )
                        onDragChanged?(globalFrameWithOffsetApplied)
                    }
                    .onEnded { value in
                        onDragEnded?(globalFrameWithOffsetApplied)
                        withAnimation{
                            offset = .zero
                        }
                    }
            )
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            globalFrame = proxy.frame(in: .global)
                        }
                        .onChange(of: proxy.frame(in: .global)) { _, newValue in
                            globalFrame = newValue
                        }
                        .onChange(of: offset) { _, newValue in
                            print("### globalFrame \(globalFrame)")
                            print("### offset \(newValue)")
                            print("### applied \(globalFrameWithOffsetApplied)")
                        }
                }
            )
    }
    
    private var isDragging: Bool {
        offset != .zero
    }
    
    public init(
        onDragChanged: ((CGRect) -> Void)? = nil,
        onDragEnded: ((CGRect) -> Void)? = nil
    ) {
        self.onDragChanged = onDragChanged
        self.onDragEnded = onDragEnded
    }
}

extension View {
    public func draggable(
        onDragChanged: ((CGRect) -> Void)? = nil,
        onDragEnded: ((CGRect) -> Void)? = nil
    ) -> some View {
        modifier(DragModifier(
            onDragChanged: onDragChanged,
            onDragEnded: onDragEnded
        ))
    }
}
