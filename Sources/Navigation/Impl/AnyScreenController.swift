import Foundation

struct AnyScreenController {
    private let base: any ScreenController
    private let _createView: (ScreenPayload?) -> ScreenView
    private let _didReceivePayload: (ScreenView, ScreenPayload) -> Void
    private let _updateState: (ScreenView, ScreenControllerState, ScreenControllerState) -> Void
    private let _prepareForReuse: (ScreenView, any Screen) -> Void
    private let _preload: (ScreenView) async -> Void

    init<E: ScreenController>(_ base: E) {
        self.base = base
        _createView = { payload in
            base.createView(payload: payload.map { payload in
                payload as! E.ScreenPayloadType
            })
        }
        _didReceivePayload = { view, payload in
            base.didReceivePayload(
                view: view as! E.ScreenViewType,
                payload: payload as! E.ScreenPayloadType
            )
        }
        _updateState = { view, prev, new in
            base.updateState(
                view: view as! E.ScreenViewType,
                previousState: prev,
                newState: new
            )
        }
        _prepareForReuse = { view, screen in
            base.prepareForReuse(view: view as! E.ScreenViewType,
                                 newScreen: screen as! E.ScreenType)
        }
        _preload = { view in
            await base.preload(view: view as! E.ScreenViewType)
        }
    }

    func createView(payload: ScreenPayload) -> ScreenView {
        _createView(payload)
    }
    
    func didReceivePayload(view: ScreenView, payload: ScreenPayload) {
        _didReceivePayload(view, payload)
    }
    
    func updateState(view: ScreenView, prevState: ScreenControllerState, newState: ScreenControllerState) {
        _updateState(view, prevState, newState)
    }
    
    func prepareForReuse(view: ScreenView, screen: any Screen) async {
        _prepareForReuse(view, screen)
    }
}
