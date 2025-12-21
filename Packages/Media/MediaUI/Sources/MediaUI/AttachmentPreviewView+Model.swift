import Foundation
import MediaModel

extension AttachmentPreviewView {
    public struct Model: Equatable, Sendable {
        public let state: State
        
        public enum State: Equatable, Sendable {
            case uploading
            case loaded(MediaAttachment)
            case error
        }
    }
}
