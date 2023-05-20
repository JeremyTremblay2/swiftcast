import SwiftUI

struct PodcastItemThumbnail: View {
    var podcast: Podcast
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(podcast.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
        .frame(width: width, height: height)
    }
}

struct PodcastItemThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        
        Group {
            PodcastItemThumbnail(podcast: podcasts[4], width: 200, height: 200)
            PodcastItemThumbnail(podcast: podcasts[4], width: 200, height: 200).preferredColorScheme(.dark)
        }
    }
}
