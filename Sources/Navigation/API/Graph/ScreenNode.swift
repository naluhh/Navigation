import Foundation

public class ScreenNode {
    private var inEdges: [ScreenConnection]
    private var outEdges: [ScreenConnection]
    private let screen: ScreenDescription

    public init(_ screen: ScreenDescription) {
        inEdges = []
        outEdges = []
        self.screen = screen
    }

    @discardableResult
    public func connectTo(_ other: ScreenNode, type: ConnectionType, transition: some ScreenTransitionProvider) -> ScreenNode {
        let connection = ScreenConnection(
            in: self,
            out: other,
            type: type,
            transition: transition.asAnyScreenTransitionProvider
        )
        outEdges.append(connection)
        other.inEdges.append(connection)

        return other
    }
}
