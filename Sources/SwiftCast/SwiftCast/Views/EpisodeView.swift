import Foundation
import SwiftUI

struct EpisodeView: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(episode.date, formatter: dateFormatter)
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
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 200)
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        guard let currentWeek = Calendar.isDayInCurrentWeek(date: episode.date) else {
            return formatter
        }
        if currentWeek {
            formatter.dateFormat = "EEEE"
        }
        else {
            guard let currentYear = Calendar.isDayInCurrentYear(date: episode.date) else {
                return formatter
            }
            if currentYear {
                formatter.dateFormat = "dd MMM"
            }
        }
        return formatter
    }

}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        EpisodeView(episode: stub.loadPodcasts()[0].episodes[0])
    }
}
