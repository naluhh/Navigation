import Foundation

public class ScreenNode {
    private var inEdges: [ScreenNode]
    private var outEdges: [ScreenNode]
    
    public init() {
        inEdges = []
        outEdges = []
    }
    
    public func addEdge(edge: Edge) {
        outEdges.append(edge)
        edge.to.inEdges.append(edge)
    }
}
