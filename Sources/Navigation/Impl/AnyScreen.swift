import Foundation

public struct AnyScreen: Hashable {
    public let value: any Screen
    private let equals: (any Screen) -> Bool
    private let hashClosure: (inout Hasher)->Void
    
    public init<E: Hashable & Screen>(_ value: E) {
        self.value = value
        self.equals = { rhs in
            if let typedRhs = rhs as? E {
                return typedRhs == value
            }
            return false
        }
        self.hashClosure = { hasher in
            value.hash(into: &hasher)
        }
    }
    
    public static func ==(lhs: AnyScreen, rhs: AnyScreen) -> Bool {
        return lhs.equals(rhs.value)
    }
    
    var uniqueIdentifier: String {
        return String(describing: type(of: value))
    }
    
    public func hash(into hasher: inout Hasher) {
        self.hashClosure(&hasher)
    }
}

extension Screen {
    var asAnyScreen: AnyScreen {
        return AnyScreen(self)
    }
}
