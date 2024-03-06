import Foundation

class ScreenConnection {
    let `in`: ScreenNode
    let out: ScreenNode
    let type: ConnectionType
    let transition: AnyScreenTransitionProvider

    public init(in: ScreenNode, out: ScreenNode, type: ConnectionType, transition: AnyScreenTransitionProvider) {
        self.in = `in`
        self.out = out
        self.type = type
        self.transition = transition
    }
}
