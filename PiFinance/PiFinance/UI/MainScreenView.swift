//
//  MainScreenView.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import PiUI
import PiNavigation

struct MainScreenView: View {
    @EnvironmentObject var navManager:PiNavigationManager
    
    var body: some View {
        switch navManager.mainScreen {
        case .Splash:
            SplashView().environmentObject(navManager)
        case .Dashboard:
            DashboardView()
        default:
            SplashView().environmentObject(navManager)
        }
    }
}

#Preview {
    MainScreenView().environmentObject(PiNavigationManager())
}
