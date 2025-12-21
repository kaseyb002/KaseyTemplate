import SwiftUI

public struct JiggleModifier: ViewModifier {
    public enum Direction {
        case horizontal(firstJiggleTowards: HorizontalDirection)
        case vertical(firstJiggleTowards: VerticalDirection)
        
        public enum HorizontalDirection {
            case leading, trailing
        }
        
        public enum VerticalDirection {
            case top, bottom
        }
        
        public var isHorizontal: Bool {
            switch self {
            case .horizontal: return true
            case .vertical: return false
            }
        }
        
        public var isVertical: Bool { !isHorizontal }
        
        public var isFirstJiggleTowardsNegativeDirection: Bool {
            switch self {
            case .horizontal(let firstJiggleTowards):
                switch firstJiggleTowards {
                case .leading:
                    true
                    
                case .trailing:
                    false
                }
                
            case .vertical(let firstJiggleTowards):
                switch firstJiggleTowards {
                case .top:
                    true
                    
                case .bottom:
                    false
                }
            }
        }
    }
    
    private let direction: Direction
    private let restDuration: TimeInterval
    private let jiggleDuration: TimeInterval = 0.3
    private var atOffsetDuration: TimeInterval { jiggleDuration }
    
    @State private var offset: CGFloat = 0
    
    public init(direction: Direction, restDuration: Double) {
        self.direction = direction
        self.restDuration = restDuration
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: direction.isHorizontal ? offset : 0,
                    y: direction.isVertical ? offset : 0)
            .onAppear {
                Task {
                    while true {
                        // One jiggle cycle (two quick shakes + return to 0)
                        await animateJiggle()
                        // Pause at center
                        try? await Task.sleep(for: .seconds(restDuration))
                    }
                }
            }
    }
    
    @MainActor
    private func animateJiggle() async {
        var offset: CGFloat = direction.isFirstJiggleTowardsNegativeDirection ? -8 : 8
        withAnimation(.easeInOut(duration: jiggleDuration)) { self.offset = offset }
        try? await Task.sleep(for: .seconds(atOffsetDuration))
        
        offset = direction.isFirstJiggleTowardsNegativeDirection ? 2 : -2
        withAnimation(.easeInOut(duration: jiggleDuration)) { self.offset = offset }
        try? await Task.sleep(for: .seconds(atOffsetDuration))

        offset = direction.isFirstJiggleTowardsNegativeDirection ? -8 : 8
        withAnimation(.easeInOut(duration: jiggleDuration)) { self.offset = offset }
        try? await Task.sleep(for: .seconds(atOffsetDuration))

        withAnimation(.easeInOut(duration: jiggleDuration)) { self.offset = 0 }
        try? await Task.sleep(for: .seconds(atOffsetDuration))
    }
}

public extension View {
    func jiggle(
        direction: JiggleModifier.Direction,
        restDuration: Double = 1.5
    ) -> some View {
        self.modifier(JiggleModifier(direction: direction, restDuration: restDuration))
    }
}
