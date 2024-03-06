import Foundation

public protocol Screen: Hashable {
    associatedtype PayloadType: ScreenPayload
    
    var isOpaque: Bool {get}
    var canBeReused: Bool {get}
}

extension Screen {
    var isOpaque: Bool { true }
    var canBeReused: Bool { true }
}
