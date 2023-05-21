import Foundation

public extension Duration {
    func formattedHoursAndMinutes() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .short
        
        var components = DateComponents()
        components.hour = Int(self.components.seconds) / 3600
        components.minute = (Int(self.components.seconds) % 3600) / 60
        if self.components.seconds % 60 > 30 { // Round the result like in the podcast app.
            components.minute! += 1
        }
        if let duration = formatter.string(from: components) {
            return duration
        } else {
            return ""
        }
    }
}
