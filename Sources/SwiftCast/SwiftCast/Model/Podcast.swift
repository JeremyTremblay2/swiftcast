import Foundation

public struct Podcast: CustomStringConvertible, Hashable, Identifiable {
    public var id: UUID = UUID()
    var imageName: String
    var title: String
    var updateDate: Date
    var author: String
    var rating: Float
    var numberOfReviews: Int
    var category: String
    var publicationFrequency: PublicationFrequency
    var episodes: [Episode]
    
    public init?(withImage imageName: String, withTitle title: String, withLastUpdateDate updateDate: Date,
                fromAuthor author: String, withNote rating: Float, fromManyReviews numberOfReviews: Int,
                fromCategory category: String, withAPublicationFrequency publicationFrequency: PublicationFrequency,
                withEpisodes episodes: [Episode]) {
        guard episodes.count > 0 else {
            return nil
        }
        self.imageName = imageName
        self.title = title
        self.updateDate = updateDate
        self.author = author
        self.rating = rating
        self.numberOfReviews = numberOfReviews
        self.category = category
        self.publicationFrequency = publicationFrequency
        self.episodes = episodes
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
