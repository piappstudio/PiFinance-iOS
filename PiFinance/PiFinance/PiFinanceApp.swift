//
//  PiFinanaceApp.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import SwiftData
import PiNavigation
import PiModel

@main
struct PiFinanceApp: App {
    
    @StateObject var navManager:PiNavigationManager = PiNavigationManager()
    
    var body: some Scene {
        WindowGroup {
            MainScreenView().environmentObject(navManager).onOpenURL(perform: { url in
                
                // pifin://lender?params = {json value}
                let deepLink = url.absoluteString
                
                
                print(deepLink)
                guard let scheme = url.scheme, scheme == "pifin" else {
                    return
                }
                guard let strTab = url.host, let mainTab = PiTabInfo(rawValue:strTab)  else {
                    return
                }
                
                // Reset the tab
                navManager.activeTab = mainTab
                
                if url.pathComponents.count >= 2  {
                    
                    let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false)
                    let lastComponent = url.lastPathComponent
                    
                    var navInfo = PiNavInfo(routeId: lastComponent)
                    
                    let params = urlComponent?.queryItems?.reduce(into: [String:String]()) { dict, queryItem in
                        dict[queryItem.name] = queryItem.value
                    }
                    
                    if let strDict = JsonCoder.encode(type: params) {
                        navInfo.dict = ["data":strDict]
                    }
                    
                
                    dump(navInfo)
                    
                    // Detect the navigation path
                    switch mainTab {
                    case .lender:
                        navManager.lenderNavPath.append(navInfo)
                    case .borrower:
                        navManager.borrowerNavPath.append(navInfo)
                    case .notification:
                        navManager.notificationNavPath.append(navInfo)
                    case .settings:
                        navManager.settingNavPath.append(navInfo)
                    }
                }
              
            
            })
        }
        .modelContainer(for: Item.self)
    }
}
