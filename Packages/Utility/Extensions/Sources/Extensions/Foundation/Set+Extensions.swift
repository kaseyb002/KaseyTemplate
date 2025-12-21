import Foundation

extension Set {
    public init(
        @ArrayBuilder<Element> builder: () -> [Element]
    ) async {
        self = Set(builder())
    }
    
    public init(
        @ArrayBuilder<Element> asyncBuilder: () async -> [Element]
    ) async {
        self = await Set(asyncBuilder())
    }
}
