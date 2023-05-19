import Foundation

public struct MenuSection: Hashable, CustomStringConvertible, Identifiable {
    public var id: UUID = UUID()
    
    var imageName: String
    var sectionName: String
    
    public init(withImage imageName: String, withName sectionName: String) {
        self.imageName = imageName
        self.sectionName = sectionName
    }
    
    public var description: String {
       return "[\(id)] \(sectionName)\n"
    }
    
    public static func == (lhs: MenuSection, rhs: MenuSection) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
