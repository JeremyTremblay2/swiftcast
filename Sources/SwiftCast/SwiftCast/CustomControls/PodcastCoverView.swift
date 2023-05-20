import SwiftUI

struct PodcastCoverView: View {
    var podcast: Podcast
    
    var paddingLeading: CGFloat
    var paddingTrailing: CGFloat
    public var backgroundColor: Color
    
    private var colorScheme: ColorScheme
    
    init(podcast: Podcast, paddingLeading: CGFloat, paddingTrailing: CGFloat, backgroundColor: Color) {
        colorScheme = .light
        self.podcast = podcast
        self.paddingLeading = paddingLeading
        self.paddingTrailing = paddingTrailing
        self.backgroundColor = backgroundColor
        colorScheme = backgroundColor.getBestColorScheme()
    }
    
    private var plusButton: some View {
        HStack(alignment: .bottom, spacing: 0) {
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor.opacity(0), backgroundColor.opacity(1)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 40, height: 20)
            
            Button(action: {}) {
                Text("PLUS")
                    .font(.callout)
                    .foregroundColor(PodcastColors.foregroundPrimary)
                    .environment(\.colorScheme, colorScheme)
            }
            .padding(.leading, 10)
            .background(backgroundColor)
        }
        .padding(.bottom, 9)
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                //GeometryReader { geo in
                VStack(spacing: 0) {
                    Image(podcast.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .cornerRadius(7)
                        .shadow(color: .black.opacity(0.4), radius: 8)
                    /*.frame(width: geo.size.width * 0.55, height: geo.size.width * 0.55)
                     .frame(width: geo.size.width)*/
                        .padding(.horizontal, 70)
                    
                    Text(podcast.title)
                        .font(.title2)
                        .bold()
                        .padding(.top, 14)
                        .padding(.bottom, 6)
                        .foregroundColor(PodcastColors.foregroundPrimary)
                        .environment(\.colorScheme, self.colorScheme)
                    
                    Label("\(podcast.author) >", systemImage: "tv")
                        .font(.body)
                        .font(.system(size: 12))
                        .padding(.bottom, 20)
                        .foregroundColor(PodcastColors.foregroundPrimary)
                        .environment(\.colorScheme, self.colorScheme)
                    
                    //GeometryReader { geo in
                    VStack(alignment: .center, spacing: 0) {
                        Button(action: {}) {
                            Label("Dernier épisode", systemImage: "play.fill")
                                .bold()
                                .padding(7)
                            //.frame(width: geo.size.width * 0.65)
                                .padding(.horizontal, 50)
                                .foregroundColor(PodcastColors.foregroundPrimary)
                                .environment(\.colorScheme, colorScheme  == .dark ? .light : .dark)
                        }
                        .buttonStyle(.automatic)
                        .tint(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(PodcastColors.backgroundPrimary.opacity(0.8))
                        .environment(\.colorScheme, colorScheme  == .dark ? .light : .dark)
                        .cornerRadius(12)
                        
                        ZStack {
                            Text("**\(formatDate(date: podcast.episodes.first!.date, formatter: generateShortDateFormatter(date: podcast.episodes.first!.date))): \(podcast.episodes.first?.title ?? "")**: \(podcast.episodes.first?.script ?? "")")
                                .lineLimit(3)
                                .padding(.top, 16)
                                .padding(.bottom, 10)
                                .overlay(plusButton, alignment: .bottomTrailing)
                                .foregroundColor(PodcastColors.foregroundPrimary)
                                .environment(\.colorScheme, colorScheme)
                        }
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14)
                                .padding(.trailing, 4)
                                .foregroundColor(PodcastColors.foregroundPrimary)
                                .environment(\.colorScheme, colorScheme)
                            Text("**\(podcast.rating, specifier: "%.1f")** (\(podcast.numberOfReviews))・\(podcast.category)・Chaque semaine")
                                .font(.subheadline)
                                .foregroundColor(PodcastColors.foregroundPrimary)
                                .environment(\.colorScheme, colorScheme)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    //}
                    //}
                }
            }
            .padding(.bottom, 22)
            .padding(.leading, paddingLeading)
            .padding(.trailing, paddingTrailing)
            .background(backgroundColor)
        }
    }
}

struct PodcastCoverView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodcastCoverView(podcast: podcasts[0], paddingLeading: 20, paddingTrailing: 20, backgroundColor: Color.indigo)
            PodcastCoverView(podcast: podcasts[0], paddingLeading: 20, paddingTrailing: 20, backgroundColor: Color.indigo)
                .preferredColorScheme(.dark)
        }
    }
}
