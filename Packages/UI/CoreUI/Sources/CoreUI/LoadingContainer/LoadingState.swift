import Foundation

public enum LoadingState<Value: Sendable> {
    case idle,
         loading,
         error(Error),
         loaded(Value)
    
    var isLoaded: Bool {
        switch self {
        case .idle, .loading, .error:
            false
            
        case .loaded:
            true
        }
    }
    
    var isError: Bool {
        switch self {
        case .idle, .loading, .loaded:
            false
            
        case .error:
            true
        }
    }
}

