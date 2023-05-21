import SwiftUI

struct ContentView<Content: View>: View {
    let content: Content
    var podcasts: [Podcast]

    init(podcasts: [Podcast], @ViewBuilder content: () -> Content) {
        self.content = content()
        self.podcasts = podcasts
    }

    var body: some View {
        ZStack {
            content
            VStack {
                Spacer()
                CurrentEpisodePlayingView(podcastImageName: podcasts.first!.imageName,
                                          podcastName: podcasts.first!.title,
                                          episode: (podcasts.first?.episodes.first)!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            ContentView(podcasts: podcasts) {
                PodcastListView(podcasts: podcasts)
            }
            ContentView(podcasts: podcasts) {
                PodcastListView(podcasts: podcasts)
                    .preferredColorScheme(.dark)
            }
        }
    }
}

