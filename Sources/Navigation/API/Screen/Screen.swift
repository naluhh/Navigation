import Foundation

public protocol Screen: Hashable {
    var isOpaque: Bool {get}
    var canBeReused: Bool {get}
}
