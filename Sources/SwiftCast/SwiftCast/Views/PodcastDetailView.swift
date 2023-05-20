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
    @Environment(\.presentationMode) var presentationMode
    
    private var iconsColor: Color {
        return .white
    }
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 0) {
                PodcastCoverView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
                PodcastCoverDetailView(podcast: podcast, paddingLeading: paddingLeading, paddingTrailing: paddingTrailing, backgroundColor: backgroundColor)
            }
            .background(backgroundColor)
            .toolbarBackground(.visible, for: .navigationBar)
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
        .toolbarBackground(backgroundColor, for: .navigationBar)
        .toolbar {
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
                .background(PodcastColors.backgroundSecondary.opacity(0.2))
                .clipShape(Circle())
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
                    .background(PodcastColors.backgroundSecondary.opacity(0.2))
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
                                    .foregroundColor(backgroundColor.opacity(0.4))
                                    .font(Font.title.weight(.bold))
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
                .background(PodcastColors.backgroundSecondary.opacity(0.2))
                .clipShape(Circle())
                .foregroundColor(PodcastColors.primary)
                
            }

        }
        .listStyle(.grouped)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .navigationTitle(podcast.title)
        
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
