import Combine

extension Publisher {
    public func withPrevious() -> AnyPublisher<(Output, Output), Failure> {
        self
            .scan((nil, nil)) { previous, current in
                (previous.1, current)
            }
            .compactMap { previous, current in
                guard let previous, let current else { return nil }
                return (previous, current)
            }
            .eraseToAnyPublisher()
    }
}
