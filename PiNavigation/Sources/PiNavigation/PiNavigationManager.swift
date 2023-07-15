// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import PiModel

public class PiNavigationManager : ObservableObject {
    
    
    // To maintian the tab
    @Published public var activeTab: PiTabInfo = PiTabInfo.lender
    
    // All NavigationPath will take only NavInfo
    // All NavigationLink should pass only NavInfo value
    // For List item navigation use NavigationLink
    // For Button actions, Use append navigation path value
    
    @Published public var lenderNavPath = NavigationPath()
    @Published public var borrowerNavPath = NavigationPath()
    @Published public var notificationNavPath = NavigationPath()
    @Published public var settingNavPath = NavigationPath()
    
    @Published public var authNavPath = NavigationPath()
    
    @Published public var mainScreen = PiMainRouter.Splash
    
    public init () {
        
    }
    
    
    public init(lenderNavPath: NavigationPath = NavigationPath(), borrowerNavPath: NavigationPath = NavigationPath(), notificationNavPath: NavigationPath = NavigationPath(), settingNavPath: NavigationPath = NavigationPath(), authNavPath: NavigationPath = NavigationPath(), mainScreen: PiMainRouter = PiMainRouter.Splash) {
        self.lenderNavPath = lenderNavPath
        self.borrowerNavPath = borrowerNavPath
        self.notificationNavPath = notificationNavPath
        self.settingNavPath = settingNavPath
        self.authNavPath = authNavPath
        self.mainScreen = mainScreen
    }
}

