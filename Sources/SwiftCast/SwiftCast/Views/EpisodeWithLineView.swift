import Foundation
import SwiftUI

struct EpisodeWithLineView: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
                .frame(height: 2)
                .overlay(.gray)
            EpisodeView(episode: episode)
        }
    }
}

struct EpisodeWithLineView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        Group {
            EpisodeWithLineView(episode: stub.loadPodcasts()[0].episodes[0])
            EpisodeWithLineView(episode: stub.loadPodcasts()[0].episodes[0]).preferredColorScheme(.dark)
        }
    }
}
