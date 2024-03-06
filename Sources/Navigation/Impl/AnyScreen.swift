import Foundation

public struct AnyScreen: Hashable {
    public let value: any Screen
    private let equals: (any Screen) -> Bool
    private let hashClosure: (inout Hasher) -> Void

    public init<E: Hashable & Screen>(_ value: E) {
        self.value = value
        equals = { rhs in
            if let typedRhs = rhs as? E {
                return typedRhs == value
            }
            return false
        }
        hashClosure = { hasher in
            value.hash(into: &hasher)
        }
    }

    public static func == (lhs: AnyScreen, rhs: AnyScreen) -> Bool {
        lhs.equals(rhs.value)
    }
    
    public static func == (lhs: AnyScreen, rhs: any Screen) -> Bool {
        lhs.equals(rhs)
    }

    var uniqueIdentifier: String {
        String(describing: type(of: value))
    }

    public func hash(into hasher: inout Hasher) {
        hashClosure(&hasher)
    }
}

extension Screen {
    var asAnyScreen: AnyScreen {
        AnyScreen(self)
    }
}
