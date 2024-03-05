import Foundation

public enum ScreenDescription: Hashable {
    public static func == (lhs: ScreenDescription, rhs: ScreenDescription) -> Bool {
        switch (lhs, rhs) {
        case (.concrete(let lhs), .concrete(let rhs)):
            return lhs == rhs
        case (.meta(let lhs), .meta(let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
    
    static func fromConcrete<E: Screen>(_ value: E) -> ScreenDescription {
        return .concrete(value.asAnyScreen)
    }
    
    var meta: any Screen.Type {
        switch self {
        case let .meta(type):
            return type
        case let .concrete(screen):
            return type(of: screen.value)
        }
    }
    
    func typeEquals(rhs: ScreenDescription) -> Bool {
        return self.meta == rhs.meta
    }
    
    var isConcrete: Bool {
        switch self {
        case .concrete:
            return true
        case .meta:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .concrete(let anyScreen):
            anyScreen.hash(into: &hasher)
        case .meta(let screen):
            ObjectIdentifier(type(of: screen)).hash(into: &hasher)
        }
    }
    
    case concrete(AnyScreen)
    case meta(any Screen.Type)
}
