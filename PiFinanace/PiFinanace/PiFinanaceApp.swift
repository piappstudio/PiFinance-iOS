//
//  PiFinanaceApp.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import SwiftData

@main
struct PiFinanaceApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
