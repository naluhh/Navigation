import UIKit

class NavigationLayer {
    let graph: NavigationGraph
    let stack = NavigationLayerScreenStack()
    
    public var hostController: UIViewController? = nil
    
    init(_ description: LayerDescription) {
        self.graph = description.graph
    }
    
    func controllerStateQuery(_ screenController: any ScreenController) -> ControllerStateQueryResult {
        return stack.controllerStateQuery(screenController)
    }
}
