import Foundation

public struct AnyScreenTransitionProvider {
    private let base: any ScreenTransitionProvider
    private let _createTransition: (ScreenTransitionsDynamicParameters) -> ScreenTransition

    init<E: ScreenTransitionProvider>(_ base: E) {
        self.base = base
        _createTransition = { payload in
            base.createTransition(params: payload as! E.DynamicParameters)
        }
    }

    func createTransition(params: ScreenTransitionsDynamicParameters) -> ScreenTransition {
        _createTransition(params)
    }
}

extension ScreenTransitionProvider {
    var asAnyScreenTransitionProvider: AnyScreenTransitionProvider {
        AnyScreenTransitionProvider(self)
    }
}
