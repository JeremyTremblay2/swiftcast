import Foundation

public extension Calendar {
    static func isDayInCurrentWeek(date: Date) -> Bool? {
        let currentComponents = Calendar.current.dateComponents([.weekOfYear], from: Date())
        let dateComponents = Calendar.current.dateComponents([.weekOfYear], from: date)
        guard let currentWeekOfYear = currentComponents.weekOfYear, let dateWeekOfYear = dateComponents.weekOfYear else { return nil }
        return currentWeekOfYear == dateWeekOfYear
    }
    
    static func isDayInCurrentYear(date: Date) -> Bool? {
        let currentComponents = Calendar.current.dateComponents([.year], from: Date())
        let dateComponents = Calendar.current.dateComponents([.year], from: date)
        guard let currentYear = currentComponents.year, let dateYear = dateComponents.year else { return nil }
        return currentYear == dateYear
    }
}
