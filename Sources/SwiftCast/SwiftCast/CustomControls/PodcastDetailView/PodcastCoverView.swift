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
    
    var body: some View {
        VStack(spacing: 0) {
            //VStack(spacing: 0) {
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
                    }
                //}
            }
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
