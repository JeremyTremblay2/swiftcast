import SwiftUI

struct DownloadButtonView: View {
    var showBackButton: Bool = false
    
    private var iconsColor: Color {
        return showBackButton ? PodcastColors.primary : .white
    }
    
    private var iconPauseColor: Color {
        return showBackButton ? .white : PodcastColors.primary
    }
    
    private var opacityValue: CGFloat {
        return showBackButton ? 0.8 : 0.3
    }
    
    var body: some View {
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
}
