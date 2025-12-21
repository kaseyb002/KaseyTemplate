import Colors
import SwiftUI

extension View {
    public func gameViewPadding(
        top: CGFloat = 100
    ) -> some View {
        self
            .padding(.top, top)
            .padding(.bottom, 15)
    }
    
    @ViewBuilder
    public func statusBackground() -> some View {
        if #available(iOS 26.0, *) {
            self
                .fontWeight(.semibold)
                .foregroundStyle(Color.ijLabel)
                .padding(7)
                .glassEffect(.regular, in: .rect(cornerRadius: 8))
        } else {
            self
                .fontWeight(.semibold)
                .foregroundStyle(Color.ijLabel)
                .padding(7)
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 8))
        }
    }
    
    @ViewBuilder
    public func highlightedStatusBackground(
        color: Color = .ijInteractive
    ) -> some View {
        if #available(iOS 26.0, *) {
            self
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .padding(7)
                .glassEffect(.regular.tint(color.opacity(0.8)), in: .rect(cornerRadius: 8))
        } else {
            self
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .padding(7)
                .background {
                    color.opacity(0.8)
                        .mask(RoundedRectangle(cornerRadius: 8))
                }
        }
    }
    
    public func sideButtonStyling(font: Font = .body) -> some View {
        self
            .foregroundStyle(Color.ijLabel)
            .font(font)
            .bold()
    }
    
    @ViewBuilder
    public func optionalMatchedGeometryEffect<ID>(
        id: ID,
        namespace: Namespace.ID?,
        properties: MatchedGeometryProperties = .frame,
        anchor: UnitPoint = .center,
        isSource: Bool = true
    ) -> some View where ID : Hashable {
        if let namespace: Namespace.ID {
            self
                .matchedGeometryEffect(
                    id: id,
                    in: namespace,
                    properties: properties,
                    anchor: anchor,
                    isSource: isSource
                )
        } else {
            self
        }
    }
    
    public func sectionBackground() -> some View {
        self
            .background(
                Color.ijSecondaryBackground,
                in: RoundedRectangle(cornerRadius: 30)
            )
    }
}
