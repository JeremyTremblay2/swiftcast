import Foundation

public func generateShortDateFormatter(date: Date) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    guard let currentWeek = Calendar.isDayInCurrentWeek(date: date) else {
        return formatter
    }
    if currentWeek {
        formatter.dateFormat = "EEEE"
        return formatter
    }
    guard let currentYear = Calendar.isDayInCurrentYear(date: date) else {
        return formatter
    }
    if currentYear {
        formatter.dateFormat = "dd MMM"
    }
    else {
        formatter.dateFormat = "yyyy"
    }
    return formatter
}

public func generateStandardDateFormatter(date: Date) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    guard let currentWeek = Calendar.isDayInCurrentWeek(date: date) else {
        return formatter
    }
    if currentWeek {
        formatter.dateFormat = "EEEE"
    }
    else {
        guard let currentYear = Calendar.isDayInCurrentYear(date: date) else {
            return formatter
        }
        if currentYear {
            formatter.dateFormat = "dd MMM"
        }
    }
    return formatter
}

public func generateLongDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM yyyy"
    return formatter
}

public func formatDate(date: Date, formatter: DateFormatter) -> String {
    var string = formatter.string(from: date)
    if (string.hasPrefix("0")) {
        string = string.dropFirst(1).description
    }
    return string
}
