//
//  PiFinanaceApp.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import SwiftData
import PiModel

@main
struct PiFinanceApp: App {
    
    @StateObject var router:PiRouter = PiRouter()

    var body: some Scene {
        WindowGroup {
            MainScreenView().environmentObject(router)
        }
        .modelContainer(for: Item.self)
    }
}
