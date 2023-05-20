//
//  ContentView.swift
//  SwiftCast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

struct PodCastDetailView: View {
    var podcast: Podcast
    
    var paddingLeading: CGFloat = 20
    var paddingTrailing: CGFloat = 20
    
    var body: some View {
        ScrollView {
            PodcastCoverView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
            FilteringEpisodesView(paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
            ForEach (podcast.episodes) { episode in
                EpisodeWithLineView(episode: episode, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
            }
        }
    }
}

struct PodCastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodCastDetailView(podcast: podcasts[0])
            PodCastDetailView(podcast: podcasts[0]).preferredColorScheme(.dark)
        }
    }
}
