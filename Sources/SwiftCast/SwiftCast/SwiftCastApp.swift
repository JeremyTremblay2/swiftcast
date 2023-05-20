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
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        WindowGroup {
            MainView(podcasts: podcasts)
        }
    }
}
