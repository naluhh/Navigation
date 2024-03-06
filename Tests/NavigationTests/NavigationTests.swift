import XCTest
@testable import Navigation

final class NavigationTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        
    }
}


extension String: ScreenPayload {
    
}

extension UIView: ScreenView {
    
}

struct TestScreen: Screen {
    typealias PayloadType = String

    let randomID: Int
}

class TestController: ScreenController {
    typealias ScreenType = TestScreen
    typealias ScreenViewType = UIView 
    
    func createView(payload: ScreenPayloadType?) -> ScreenViewType {
        return UIView()
    }

    func updateState(
        view: UIView,
        previousState: ScreenControllerState,
        newState: ScreenControllerState
    ) {
        
    }

    func didReceivePayload(view: UIView, payload: String) {
        
    }
    
    func prepareForReuse(view: UIView, newScreen: ScreenType) {
        
    }
    
    func preload(view: UIView) async {
        
    }
}


