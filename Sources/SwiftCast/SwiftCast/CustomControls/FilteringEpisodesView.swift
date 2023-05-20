import Foundation
import SwiftUI

struct FilteringEpisodesView: View {
    var paddingLeading: CGFloat
    var paddingTrailing: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("Épisodes")
                .font(.title2)
                .bold()
                .padding(.trailing, 8)
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .frame(width: 15)
            Spacer()
            Text("Tout voir")
                .font(.body)
                .padding(.trailing, 2)
        }
        .padding(.trailing, paddingTrailing)
        .padding(.leading, paddingLeading)
    }
}

struct FilteringEpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilteringEpisodesView(paddingLeading: 20, paddingTrailing: 20)
            FilteringEpisodesView(paddingLeading: 20, paddingTrailing: 20)
                .preferredColorScheme(.dark)
        }
    }
}
