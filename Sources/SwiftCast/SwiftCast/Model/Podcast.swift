import Foundation

public struct Podcast: CustomStringConvertible, Hashable, Identifiable {
    public var id: UUID = UUID()
    var imageName: String
    var title: String
    var author: String
    var rating: Float
    var numberOfReviews: Int
    var category: String
    var publicationFrequency: PublicationFrequency
    var episodes: [Episode]
    
    var updateDate: Date {
        return episodes.sorted(by: { $0.date > $1.date }).first?.date ?? Date()
    }
    
    public init?(withImage imageName: String, withTitle title: String, fromAuthor author: String,
                 withNote rating: Float, fromManyReviews numberOfReviews: Int, fromCategory category: String,
                 withAPublicationFrequency publicationFrequency: PublicationFrequency, withEpisodes episodes: [Episode]) {
        guard episodes.count > 0 else {
            return nil
        }
        self.imageName = imageName
        self.title = title
        self.author = author
        self.rating = rating
        self.numberOfReviews = numberOfReviews
        self.category = category
        self.publicationFrequency = publicationFrequency
        self.episodes = episodes.sorted(by: { $0.date > $1.date })
    }
    
    public var description: String {
        var string = "[\(id)] \(title) - \(author) - \(updateDate)\n"
        string.append("\(episodes.first?.description ?? "")\nEpisodes:\n")
        for episode in episodes {
            string.append("\(episode)\n")
        }
        string.append("Note: \(rating) (\(numberOfReviews) - \(category) \(publicationFrequency.description)\n")
        return string
    }
    
    public static func == (lhs: Podcast, rhs: Podcast) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
