import Foundation

private class ScreenConnection {
    let `in`: ScreenNode
    let out: ScreenNode
    let type: ConnectionType
    let transition: AnyScreenTransition

    public init(in: Node, out: Node, type: ConnectionType) {
        self.in = `in`
        self.out = out
    }
}
