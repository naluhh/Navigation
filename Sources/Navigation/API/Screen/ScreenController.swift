import Foundation

public protocol ScreenController {
    associatedtype ScreenType: Screen
    associatedtype ScreenViewType: ScreenView
    associatedtype ScreenPayloadType

    func createView(payload: ScreenPayloadType?) -> ScreenViewType
    func updateState(
        view: ScreenViewType,
        previousState: ScreenControllerState,
        newState: ScreenControllerState
    )
    func didReceivePayload(view: ScreenViewType, payload: ScreenPayloadType)
    func prepareForReuse(view: ScreenViewType, newScreen: ScreenType)
    func preload(view: ScreenViewType) async
}
