import Foundation

@MainActor
public protocol LoadableScreenController: ObservableObject {
    associatedtype DataObject: Sendable
    
    var loadingState: LoadingState<DataObject> { get }
    
    func load()
}
