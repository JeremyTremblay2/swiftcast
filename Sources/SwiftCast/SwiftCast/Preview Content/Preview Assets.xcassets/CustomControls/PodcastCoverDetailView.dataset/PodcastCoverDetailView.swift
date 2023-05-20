import SwiftUI

struct PodcastCoverDetailView: View {
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
        }
        .padding(.top, 0)
        .padding(.bottom, 22)
        .padding(.leading, paddingLeading)
        .padding(.trailing, paddingTrailing)
        .background(backgroundColor)
    }
}

struct PodcastCoverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodcastCoverDetailView(podcast: podcasts[0], paddingLeading: 20, paddingTrailing: 20, backgroundColor: Color.indigo)
            PodcastCoverDetailView(podcast: podcasts[0], paddingLeading: 20, paddingTrailing: 20, backgroundColor: Color.black)
                .preferredColorScheme(.dark)
        }
    }
}
