//
//  MainScreenView.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import PiUI
import PiModel

struct MainScreenView: View {
    @EnvironmentObject var router:PiRouter
    
    var body: some View {
        switch router.mainScreen {
        case .Splash:
            SplashView().environmentObject(router)
        case .Dashboard:
            DashboardView()
        default:
            SplashView().environmentObject(router)
        }
    }
}

#Preview {
    MainScreenView()
}
