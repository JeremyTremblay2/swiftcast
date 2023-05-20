import SwiftUI

struct PodcastItemThumbnail: View {
    var podcast: Podcast
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(podcast.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(7)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(podcast.title)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 4)
                Text("Mise à jour : \(formatDate(date: podcast.updateDate, formatter: generateStandardDateFormatter(date: podcast.updateDate)))")
                    .font(.body)
            }
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct PodcastItemThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        
        Group {
            PodcastItemThumbnail(podcast: podcasts[4])
            PodcastItemThumbnail(podcast: podcasts[4])
                .preferredColorScheme(.dark)
        }
    }
}
