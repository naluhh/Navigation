import Foundation

public protocol ScreenTransitionsDynamicParameters {
    
}

public protocol ScreenTransitionProvider {
    associatedtype DynamicParameters: ScreenTransitionsDynamicParameters
    
    func createTransition(params: ScreenTransitionsDynamicParameters) -> ScreenTransition
}


public protocol ScreenTransition {
    func prepare(originController: any ScreenController,
                 originView: any ScreenView,
                 destinationController: any ScreenController,
                 destinationView: any ScreenView,
                 isInteractive: Bool)
}
