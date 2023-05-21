//
//  EllipsisButtonView.swift
//  SwiftCast
//
//  Created by etudiant on 21/05/2023.
//

import SwiftUI

struct EllipsisButtonView: View {
    var showBackButton: Bool = false
    
    private var iconsColor: Color {
        return showBackButton ? PodcastColors.primary : .white
    }
    
    private var opacityValue: CGFloat {
        return showBackButton ? 0.8 : 0.3
    }
    
    var body: some View {
        ZStack {
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(iconsColor)
                    .padding(.trailing, 8)
            }
            .padding(.vertical, 8)
            .background(PodcastColors.backgroundSecondary.opacity(opacityValue))
            .clipShape(Circle())
            .foregroundColor(PodcastColors.primary)
        }
    }
}
