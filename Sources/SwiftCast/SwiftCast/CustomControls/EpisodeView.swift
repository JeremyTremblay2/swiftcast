import Foundation
import SwiftUI

struct EpisodeView: View {
    var episode: Episode
    
    var paddingLeading: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(formatDate(date: episode.date, formatter: generateStandardDateFormatter(date: episode.date)))
                .font(.caption)
                .bold()
                .textCase(.uppercase)
                .padding(.bottom, 2)
            
            // Only the played episodes are not bold.
            if episode.isPlayed {
                Text(episode.title)
                    .font(.title2)
            } else {
                Text(episode.title)
                    .font(.title3)
                    .bold()
            }
            
            Text(episode.script)
                .padding(.top, 6)
                .font(.callout)
            
            HStack(spacing: 0) {
                Button(action: {}) {
                    Image(systemName: "play.fill")
                        .frame(width: 33, height: 33)
                        .foregroundColor(Color.purple)
                        .background(Color.primary)
                        .clipShape(Circle())
                }
                .padding(.leading, 2)
                .padding(.trailing, 10)
                
                // Format the date and add a text depending on the played status of the episode.
                if episode.isPlayed {
                    ProgressView(value: 0.1)
                        .frame(width: 80)
                    Text("Il reste \(episode.duration.formattedHoursAndMinutes())")
                        .foregroundColor(Color.accentColor)
                        .padding(.leading, 12)
                } else {
                    Text("\(episode.duration.formattedHoursAndMinutes())")
                        .foregroundColor(Color.accentColor)
                }
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.trailing, 2)
                
            }
            .padding(.top, 10)
        }
        .padding(.leading, paddingLeading)
        .padding(.trailing, paddingTrailing)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        Group {
            EpisodeView(episode: stub.loadPodcasts()[0].episodes[0], paddingLeading: 20, paddingTrailing: 20)
            EpisodeView(episode: stub.loadPodcasts()[0].episodes[0], paddingLeading: 20, paddingTrailing: 20)
                .preferredColorScheme(.dark)
        }
    }
}
