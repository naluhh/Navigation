import Foundation

public struct Navigable {
    let screen: any Screen
    let payload: ScreenPayload?

    init(screen: any Screen, payload: any ScreenPayload) {
        self.screen = screen
        self.payload = payload
    }
}
