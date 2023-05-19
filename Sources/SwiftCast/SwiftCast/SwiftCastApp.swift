//
//  SwiftCastApp.swift
//  SwiftCast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

@main
struct SwiftCastApp: App {
    var body: some Scene {
        WindowGroup {
            var stub = Stub()
            EpisodeView(episode: stub.loadPodcasts()[0].episodes[0])
        }
    }
}
