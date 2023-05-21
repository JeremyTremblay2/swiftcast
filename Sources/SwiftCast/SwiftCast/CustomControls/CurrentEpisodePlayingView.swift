import SwiftUI

struct CurrentEpisodePlayingView : View {
    var podcastImageName: String
    var podcastName: String
    var episode: Episode
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {}) {
                HStack(spacing: 0) {
                    Image(podcastImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(4)
                        .frame(width: 55, height: 55)
                        .shadow(radius: 6, x: 0, y: 3)
                        .padding(.leading, 20)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(podcastName) \(episode.title)")
                            .font(.body)
                            .padding(.bottom, 3)
                            .lineLimit(1)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(PodcastColors.foregroundPrimary)
                        Text(formatDate(date: episode.date, formatter: generateLongDateFormatter()))
                            .foregroundColor(PodcastColors.foregroundSecondary)
                    }
                    .padding(.leading, 14)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {}) {
                Image(systemName: "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .font(.title3)
                    .foregroundColor(PodcastColors.foregroundPrimary)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 16)
            
            Button(action: {}) {
                Image(systemName: "goforward.30")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(PodcastColors.foregroundPrimary)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 20)
        }
        .background(.thinMaterial)
    }
}

struct CurrentEpisodePlayingView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcast = stub.loadPodcasts()[4]
        Group {
            CurrentEpisodePlayingView(podcastImageName: podcast.imageName, podcastName: podcast.title, episode: podcast.episodes[0])
            CurrentEpisodePlayingView(podcastImageName: podcast.imageName, podcastName: podcast.title, episode: podcast.episodes[0])
                .preferredColorScheme(.dark)
        }
    }
}
