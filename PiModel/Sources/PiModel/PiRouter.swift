//
//  File.swift
//  
//
//  Created by Boobalan on 7/8/23.
//

import Foundation
import SwiftUI

public enum PiMainRouter {
    case Splash
    case Dashboard
    case SignIn
    case SignUp
}

public class PiRouter:ObservableObject {
    @Published public var path = NavigationPath()
    @Published public var mainScreen = PiMainRouter.Splash
    
    public init(path: NavigationPath = NavigationPath(), mainScreen: PiMainRouter = PiMainRouter.Splash) {
        self.path = path
        self.mainScreen = mainScreen
    }
    
}
