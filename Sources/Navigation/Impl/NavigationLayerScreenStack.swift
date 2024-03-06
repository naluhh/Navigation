enum ControllerStateQueryResult {
    case topMost
    case inStack
    case absent
}

class NavigationLayerScreenStack {
    var elements: [ScreenStackElement] = []
    
    func controllerStateQuery(_ screenController: any ScreenController) -> ControllerStateQueryResult {
        for i in 0..<elements.count {
            switch elements[i].state {
            case let .instanciated(screenControllerWithView):
                if screenControllerWithView.controller == screenController {
                    assert(i == elements.count - 1, "topMost should be visible")
                    return .inStack
                }
            case let .visible(screenControllerWithView):
                if screenControllerWithView.controller == screenController {
                    return i == elements.count - 1 ? .topMost : .inStack
                }
            case .idle:
                break
            }
        }
        
        return .absent
    }
}
