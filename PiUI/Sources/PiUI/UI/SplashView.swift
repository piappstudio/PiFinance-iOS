//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import PiNavigation

public struct SplashView: View {
    
    @EnvironmentObject var navManager:PiNavigationManager
    
    public init() {
        
    }
    public var body: some View {
        LottieView (name: "splash", completionHandler: { isFinsihed in
            navManager.mainScreen = PiMainRouter.Dashboard
        }, loopMode: .playOnce)
            .frame(width: 250, height: 250, alignment: .center)
    
    }
}
