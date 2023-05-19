public enum PublicationFrequency : Hashable, CustomStringConvertible {
    case everyDay
    case everyWeek
    case everyMonth
    case unknow
    
    public var description : String {
        switch self {
            case .everyDay: return "Every Day"
            case .everyWeek: return "Every Week"
            case .everyMonth: return "Every Month"
            default: return ""
        }
    }
    
    public static func == (lhs: PublicationFrequency, rhs: PublicationFrequency) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
