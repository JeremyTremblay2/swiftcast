import SwiftUI

struct BackButtonView: View {
    var showBackButton: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    private var iconsColor: Color {
        return showBackButton ? PodcastColors.primary : .white
    }
    
    private var opacityValue: CGFloat {
        return showBackButton ? 0.8 : 0.3
    }
    
    var body: some View {
        VStack {
            if !showBackButton {
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
                .background(PodcastColors.backgroundSecondary.opacity(opacityValue))
                .clipShape(Circle())
            }
        }
    }
}
