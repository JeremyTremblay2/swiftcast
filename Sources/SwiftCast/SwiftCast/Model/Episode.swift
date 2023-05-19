import Foundation

public struct Episode: Hashable, CustomStringConvertible, Identifiable {
    public var id: UUID = UUID()
    var date: Date
    var title: String
    var script: String
    var duration: Duration
    var isPlayed: Bool
    
    public init(withDate date: Date, withTitle title: String, withDescription script: String,
                withDuration duration: Duration, isAlreadyPlayed isPlayed: Bool = false) {
        self.date = date
        self.title = title
        self.script = script
        self.duration = duration
        self.isPlayed = isPlayed
    }
    
    public var description: String {
        var string = "[\(id)] \(title) - \(date) - \(duration)\n"
        string.append("Script: \(script)\n")
        return string
    }
    
    public static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
