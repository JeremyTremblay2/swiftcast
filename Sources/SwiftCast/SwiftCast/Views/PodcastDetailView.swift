//
//  ContentView.swift
//  SwiftCast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

struct PodcastDetailView: View {
    var podcast: Podcast
    
    var paddingBottom: CGFloat = 0
    var paddingLeading: CGFloat = 20
    var paddingTrailing: CGFloat = 20
    
    private let paddingHeightDetection: CGFloat = 254
    
    @State private var backgroundColor: Color = .clear
    @State private var showBackButton: Bool = false
    @State private var offset = CGFloat.zero
    
    private var colorScheme: ColorScheme = .light
    
    private var navigationBarColor: Color {
        return showBackButton ? .clear : backgroundColor
    }
    
    init(podcast: Podcast, paddingBottom: CGFloat = 0) {
        self.podcast = podcast
        self.paddingBottom = paddingBottom
        let appearance = UINavigationBarAppearance()
        loadBackgroundColor()
        colorScheme = backgroundColor.getBestColorScheme()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
                    PodcastCoverView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
                    PodcastCoverDetailView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
                }
                .toolbarBackground(.visible, for: .navigationBar)
                VStack {
                    FilteringEpisodesView(paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
                    ForEach (podcast.episodes) { episode in
                        EpisodeWithLineView(episode: episode, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing)
                    }
                }
            }
            .padding(.bottom, paddingBottom)
            .background(GeometryReader { // Used to get the scroll value and to change th toolbar behavior
                Color.clear.preference(key: ScrollOffsetPreferenceKey.self,
                    value: -$0.frame(in: .named("scroll")).origin.y)
            })
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                //print("offset >> \($0)")
                offset = value
                showBackButton = offset > paddingHeightDetection
            }
        }
        .coordinateSpace(name: "scroll")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.grouped)
        .navigationBarBackButtonHidden(!showBackButton)
        .toolbarBackground(!showBackButton ? navigationBarColor : .clear, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButtonView(showBackButton: showBackButton)
            }
            ToolbarItem {
                DownloadButtonView(showBackButton: showBackButton)
            }
            ToolbarItem {
                EllipsisButtonView(showBackButton: showBackButton)
            }
            ToolbarItem(placement: .principal) {
                VStack {
                    if showBackButton {
                        Text(podcast.title)
                            .font(.title3)
                            .foregroundColor(PodcastColors.foregroundPrimary)
                            .environment(\.colorScheme, colorScheme)
                    }
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
            PodcastDetailView(podcast: podcasts[0])
            PodcastDetailView(podcast: podcasts[2]).preferredColorScheme(.dark)
        }
    }
}
