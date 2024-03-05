import Foundation

public enum ScreenControllerState {
    /// ScreenView has not been instantiated, but controller is not displayed
    case instanciating
    
    /// ScreenView has been instantiated, but controller is not displayed
    case idle
    
    /// ScreenView has been instantiated, but controller hasnt been displayed yet. It's preloading
    case preloading
    
    /// ScreenView has been instantiated, but controller hasnt been displayed yet. It's now preloaded
    case preloaded
    
    /// ScreenView has been instantiated, view is appearing.
    /// completion: value in the range [0;1]
    case appearing(completion: CGFloat)
    
    /// ScreenView has been instantiated, view is displayed.
    /// focus: if a view is presented modally on top, or the view is partially hidden by a non-transparent view, focus will be false
    case displayed(focus: Bool)

    /// ScreenView has been instantiated, view is disappearing.
    /// completion: value in the range [0;1]. Start from 1 and move to 0 as the view is disappearing
    case disappearing(completion: CGFloat)
}
