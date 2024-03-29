public enum ConnectionType {
    /// Can be navigated through and used for path finding
    case navigable(weight: Int = 1)
    
    /// Will only be used to retrieve potential information between the two screens, such as transitions
    case infoOnly
}
