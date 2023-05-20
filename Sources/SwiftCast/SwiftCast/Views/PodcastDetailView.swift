//
//  ContentView.swift
//  SwiftCast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

struct PodCastDetailView: View {
    var podcast: Podcast
    
    var body: some View {
        ScrollView {
            PodcastCoverView(podcast: podcast)
        }
        .padding(16)
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
