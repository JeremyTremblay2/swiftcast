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
    
    private let paddingHeightDetection: CGFloat = 254
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var backgroundColor: Color = .clear
    @State private var showBackButton: Bool = false
    @State private var offset = CGFloat.zero
    
    private var colorScheme: ColorScheme = .light
    
    private var iconsColor: Color {
        return showBackButton ? PodcastColors.primary : .white
    }
    
    private var iconPauseColor: Color {
        return showBackButton ? .white : PodcastColors.primary
    }
    
    private var navigationBarColor: Color {
        return showBackButton ? .clear : backgroundColor
    }
    
    private var opacityValue: CGFloat {
        return showBackButton ? 0.8 : 0.3
    }
    
    init(podcast: Podcast) {
        self.podcast = podcast
        let appearance = UINavigationBarAppearance()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        loadBackgroundColor()
        colorScheme = backgroundColor.getBestColorScheme()
        if colorScheme == .light {
            appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        }
        else {
            appearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        }
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
        .navigationTitle(podcast.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadBackgroundColor()
        }
        .toolbarBackground(navigationBarColor, for: .navigationBar)
        .toolbar {
            if !showBackButton {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(iconsColor)
                            .font(Font.title.weight(.bold))
                            .padding(.leading, 6)
                            .padding(.bottom, 8)
                    }
                    .padding(.horizontal, 4)
                    .padding(.top, 6)
                    .padding(.bottom, -4)
                    .background(PodcastColors.backgroundSecondary.opacity(opacityValue))
                    .clipShape(Circle())
                }
            }
            ToolbarItem(placement: .principal) {
                VStack {
                    if !showBackButton {
                        Text(podcast.title)
                            .font(.title3)
                            .foregroundColor(PodcastColors.foregroundPrimary)
                            .environment(\.colorScheme, colorScheme)
                    }
                    else {
                        Text(podcast.title)
                            .font(.title3)
                            .foregroundColor(PodcastColors.foregroundPrimary)
                    }
                }
            }
            ToolbarItem {
                ZStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(iconsColor)
                            .font(Font.title.weight(.bold))
                    }
                    .background(PodcastColors.backgroundSecondary.opacity(opacityValue))
                    .clipShape(Circle())
                    
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "pause.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 7, height: 7)
                                    .foregroundColor(iconPauseColor.opacity(0.9))
                                    .font(Font.title.weight(.heavy))
                            }
                            .background(iconsColor)
                            .clipShape(Circle())
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.top, 14)
                }
            }
            ToolbarItem {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(iconsColor)
                        .padding(.trailing, 8)
                }
                .padding(.vertical, 8)
                .background(PodcastColors.backgroundSecondary.opacity(opacityValue))
                .clipShape(Circle())
                .foregroundColor(PodcastColors.primary)
                
            }
            
        }
        .listStyle(.grouped)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(!showBackButton)
        .coordinateSpace(name: "scroll")
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
