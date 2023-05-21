import SwiftUI

struct PodcastItemThumbnailView: View {
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
                    .foregroundColor(PodcastColors.foregroundPrimary)
                Text("Mise à jour : \(formatDate(date: podcast.updateDate, formatter: generateStandardDateFormatter(date: podcast.updateDate)))")
                    .font(.body)
                    .foregroundColor(PodcastColors.foregroundSecondary)
            }
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct PodcastItemThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        
        Group {
            PodcastItemThumbnailView(podcast: podcasts[4])
            PodcastItemThumbnailView(podcast: podcasts[4])
                .preferredColorScheme(.dark)
        }
    }
}
