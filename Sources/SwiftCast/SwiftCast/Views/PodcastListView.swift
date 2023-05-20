import SwiftUI

struct PodcastListView: View {
    var podcasts: [Podcast]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
           ScrollView {
               LazyVGrid(columns: columns, spacing: 0) {
                   ForEach(podcasts.sorted { $0.updateDate < $1.updateDate }, id: \.id) { podcast in
                       NavigationLink(value: podcast) {
                           PodcastItemThumbnail(podcast: podcast)
                       }
                       .navigationDestination(for: Podcast.self) { podcast in
                           PodCastDetailView(podcast: podcast)
                       }
                       .padding(.horizontal, 2)
                       .padding(.top, 30)
                   }
               }
               .navigationTitle("Podcasts")
               .padding(.horizontal, 20)
           }
           
           .toolbar {
               Button(action: {}) {
                   Image(systemName: "ellipsis")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 20, height: 20)
               }
               .padding(.trailing, 8)
               .background(Color.green)
               .clipShape(Circle())
           }
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
