import SwiftUI

struct MainView: View {
    var podcasts: [Podcast]
    @State private var userChoice: Tab = .library
    
    private enum Tab {
        case listen
        case explore
        case library
        case search
    }
    
    var body: some View {
        TabView(selection: $userChoice) {
            Text("Page introuvable.")
                .tabItem({
                    Label("Écouter", systemImage: "play.circle.fill")
                })
                .tag(Tab.listen)
            Text("Désolé mais il n'y a rien à cette adresse.")
                .tabItem({
                    Label("Explorer", systemImage: "square.grid.2x2.fill")
                })
                .tag(Tab.explore)
            ContentView(podcasts: podcasts) {
                PodcastListView(podcasts: podcasts, paddingBottom: 80)
            }
            .tabItem({
                Label("Bibliothèque", systemImage: "square.stack.fill")
            })
                .tag(Tab.library)
            Text("Je suis un pot à thé.")
                .tabItem({
                    Label("Rechercher", systemImage: "magnifyingglass")
                })
                .tag(Tab.search)
        }
        .tint(PodcastColors.primary)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            MainView(podcasts: podcasts)
            MainView(podcasts: podcasts)
                .preferredColorScheme(.dark)
        }
    }
}
