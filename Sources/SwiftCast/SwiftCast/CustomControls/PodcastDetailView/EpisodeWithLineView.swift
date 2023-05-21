import Foundation
import SwiftUI

struct EpisodeWithLineView: View {
    var episode: Episode
    
    var paddingLeading: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
                .frame(height: 1)
                .overlay(PodcastColors.backgroundTertiary)
                .padding(.bottom, 24)
            EpisodeView(episode: episode, paddingLeading: 0, paddingTrailing: paddingTrailing)
        }
        .padding(.leading, paddingLeading)
    }
}

struct EpisodeWithLineView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        Group {
            EpisodeWithLineView(episode: stub.loadPodcasts()[0].episodes[0], paddingLeading: 20, paddingTrailing: 20)
            EpisodeWithLineView(episode: stub.loadPodcasts()[0].episodes[0], paddingLeading: 20, paddingTrailing: 20)
                .preferredColorScheme(.dark)
        }
    }
}
