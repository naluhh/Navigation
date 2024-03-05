import Foundation

public protocol ScreenController {
    enum ScreenControllerState<ScreenViewType> {
        /// ScreenView has not been instantiated yet
        case instanciating
        case idle(screenView: ScreenViewType)
        case preloading(screenView: ScreenViewType)
        case displayed(screenView: ScreenViewType, focus: Bool)
        case appearing(screenView: ScreenViewType, completion: CGFloat)
        case disappearing(screenView: ScreenViewType, completion: CGFloat)
    }

    associatedtype ScreenViewType: ScreenView
    associatedtype ScreenPayloadType

    func createView(payload: ScreenPayloadType?) -> ScreenViewType
    func updateState(_ previousState: ScreenControllerState, _ newState: ScreenControllerState)
    func didReceivePayload(view: ScreenViewType, payload: ScreenPayloadType)
    func prepareForReuse(view: ScreenViewType) async
}
