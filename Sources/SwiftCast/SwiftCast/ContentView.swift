//
//  ContentView.swift
//  SwiftCast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("chaleur_humaine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(7)
                .shadow(color: .black, radius: 8)
            Text("Chaleur humaine")
                .padding(.top, 4)
                .padding(.bottom, 1)
            
            Label("Le Monde >", systemImage: "tv")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.bottom, 6)
            
            Button(action: play) {
                Label("Dernier épisode", systemImage: "play.fill")
                    .bold()
                    .padding(4)
            }
            .buttonStyle(.bordered)
            .tint(.black)
            
            Text("mardi: comment se libérer de la voiture individuelle ?: **** Recevez gratuitement tous les mardis l'infolette Chaleur humaine en vous")
            
            Text("4,8 (458)・Actualités・Chaque semaine")
        }
        .background(.orange)
        .padding(16)
    }
    
    private func play() -> Void {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
