import Foundation
import UIKit

public typealias LayerIndex = Int

public class Navigation {
    private var window: UIWindow?
    private let layers: [NavigationLayer]
    
    public init(window: UIWindow,
                layerDescriptions: [LayerDescription]) {
        self.window = window
        self.layers = layerDescriptions.map { NavigationLayer($0) }
    }
    
    public func install(window: UIWindow) {
        self.window = window
    }
    
    public func navigateTo(layerIndex: LayerIndex, destination: Navigable, animated: Bool, params: ScreenTransitionsDynamicParameters) {
        
    }
    
    public func navigateTo(origin: any ScreenController, destination: Navigable, animated: Bool, params: ScreenTransitionsDynamicParameters) {
        
    }
    
    public func navigateTo(layerIndex: LayerIndex, destination: Navigable, animated: Bool, overiddenTransition: ScreenTransition) {
        
    }
    
    public func navigateTo(origin: any ScreenController, destination: Navigable, animated: Bool, overiddenTransition: ScreenTransition) {
        
    }
    
    public func preloadNavigateTo(layerIndex: LayerIndex, destination: Navigable) {
        
    }
    
    public func preloadNavigateTo(origin: any ScreenController, destination: Navigable) {
        
    }
}


public protocol NavigationDelegate: AnyObject {
    func willDismissScreen(layer: LayerIndex, screen: any Screen)
    func willMoveToScreen(layer: LayerIndex, screen: any Screen)
    func didMoveToScreen(layer: LayerIndex, screen: any Screen)
}
