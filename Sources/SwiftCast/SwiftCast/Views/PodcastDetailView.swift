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
    
    @State private var backgroundColor: Color = .clear
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                PodcastCoverView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
                PodcastCoverDetailView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
            }
            VStack {
                
                FilteringEpisodesView(paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
                ForEach (podcast.episodes) { episode in
                    EpisodeWithLineView(episode: episode, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
                }
            }
        }
        .onAppear {
            loadBackgroundColor()
        }
    }
    
    private func loadBackgroundColor() {
        let uiColor = UIImage(named: podcast.imageName)?.averageColor ?? .clear
        backgroundColor = Color(uiColor)
    }
}

struct PodCastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodCastDetailView(podcast: podcasts[0])
            PodCastDetailView(podcast: podcasts[2]).preferredColorScheme(.dark)
        }
    }
}
