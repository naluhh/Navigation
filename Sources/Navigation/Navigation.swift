import Foundation
import UIKit

public typealias LayerIdentifier = Int

public class Navigation {
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
}


public protocol NavigationDelegate: AnyObject {
    func willDismissScreen(layer: LayerIdentifier, screen: any Screen)
    func willMoveToScreen(layer: LayerIdentifier, screen: any Screen)
    func didMoveToScreen(layer: LayerIdentifier, screen: any Screen)
}
