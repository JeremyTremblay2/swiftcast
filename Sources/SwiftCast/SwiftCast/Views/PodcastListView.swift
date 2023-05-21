import SwiftUI

struct PodcastListView: View {
    var podcasts: [Podcast]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var paddingBottom: CGFloat = 0
    
    var body: some View {
        NavigationStack {
           ScrollView {
               LazyVGrid(columns: columns, spacing: 0) {
                   ForEach(podcasts.sorted { $0.updateDate < $1.updateDate }, id: \.id) { podcast in
                       NavigationLink(value: podcast) {
                           PodcastItemThumbnailView(podcast: podcast)
                       }
                       .navigationDestination(for: Podcast.self) { podcast in
                           PodcastDetailView(podcast: podcast, paddingBottom: paddingBottom)
                       }
                       .padding(.horizontal, 2)
                       .padding(.top, 24)
                   }
               }
               .navigationTitle("Podcasts")
               .padding(.horizontal, 20)
               .padding(.bottom, paddingBottom)
           }
           .toolbar {
               Button(action: {}) {
                   Image(systemName: "ellipsis")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 20, height: 20)
                       .foregroundColor(PodcastColors.primary)
                       .padding(.trailing, 8)
               }
               .padding(.vertical, 8)
               .background(PodcastColors.backgroundSecondary)
               .clipShape(Circle())
           }
           .navigationTitle("Podcasts")
       }
    }
}

struct PodcastsList_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodcastListView(podcasts: podcasts)
            PodcastListView(podcasts: podcasts).preferredColorScheme(.dark)
        }
    }
}
