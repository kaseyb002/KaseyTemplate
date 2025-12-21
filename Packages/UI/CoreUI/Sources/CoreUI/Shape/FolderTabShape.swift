import SwiftUI

public struct FolderTabShape: Shape {
    public enum Placement: Sendable { case top, bottom }
    
    private let placement: Placement
    private let outerRadius: CGFloat
    private let innerRadius: CGFloat

    public func path(in rect: CGRect) -> Path {
        switch placement {
        case .top:
            bottomTab(in: rect)
            
        case .bottom:
            bottomTab(in: rect)
        }
    }
    
    public init(
        placement: Placement,
        outerRadius: CGFloat = 12,
        innerRadius: CGFloat = 12
    ) {
        self.placement = placement
        self.outerRadius = outerRadius
        self.innerRadius = innerRadius
    }
}

// MARK: - TOP TAB VERSION
private extension FolderTabShape {
    func topTab(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        // Start at bottom-left
        path.move(to: CGPoint(x: 0, y: h))
        
        // Up left side
        path.addLine(to: CGPoint(x: 0, y: h * 0.35))
        
        // Outward rounded corner
        path.addQuadCurve(
            to: CGPoint(x: outerRadius, y: h * 0.35 - outerRadius),
            control: CGPoint(x: 0, y: h * 0.35 - outerRadius)
        )

        // Leading edge toward scoop
        let scoopStartX = outerRadius + 12
        path.addLine(to: CGPoint(x: scoopStartX, y: h * 0.1))

        // Concave scoop
        path.addQuadCurve(
            to: CGPoint(x: scoopStartX + innerRadius, y: 0),
            control: CGPoint(x: scoopStartX - innerRadius, y: 0)
        )
        
        // Straight top line
        path.addLine(to: CGPoint(x: w, y: 0))
        
        // Down right side
        path.addLine(to: CGPoint(x: w, y: h))
        
        path.closeSubpath()
        return path
    }
}

// MARK: - BOTTOM TAB VERSION (MIRRORED)
private extension FolderTabShape {
    func bottomTab(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let indentation: CGFloat = 0.1
        
        // Start at top-left
        path.move(to: .zero)
        // top-left to bottom-left
        path.addCurve(
            to: CGPoint(x: w * indentation, y: h * indentation),
            control1: CGPoint(x: .zero, y: h * indentation),
            control2: CGPoint(x: w * indentation, y: .zero)
        )
        path.addCurve(
            to: CGPoint(x: w * indentation, y: h * (1 - indentation)),
            control1: CGPoint(x: .zero, y: h * indentation),
            control2: CGPoint(x: w * indentation, y: .zero)
       )
        path.addCurve(
            to: CGPoint(x: w * indentation * 2, y: h * (1 - indentation)),
            control1: CGPoint(x: w * indentation / 4, y: h * (1 - indentation / 4)),
            control2: CGPoint(x: w * indentation / 8, y: h * (1 - indentation / 8)),
        )
        path.addLine(to: CGPoint(x: w * (1 - indentation * 2), y: h * (1 - indentation)))

        path.addQuadCurve(
            to: CGPoint(x: w, y: .zero),
            control: CGPoint(x: w * (1 - indentation), y: h * indentation)
        )
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack(spacing: .zero) {
        RoundedRectangle(cornerRadius: 30)
            .fill(.blue)
        FolderTabShape(placement: .bottom)
            .fill(.orange)
            .frame(height: 40)
            .padding(.horizontal, 40)
    }
    .frame(width: 300, height: 400)
}
