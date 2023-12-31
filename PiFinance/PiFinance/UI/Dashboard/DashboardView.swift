//
//  DashboardView.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import PiLender
import PiNavigation
import PiAuthentication
import PiBorrower
import PiShared

struct DashboardView: View {
    @EnvironmentObject var navManager:PiNavigationManager
    
    var body: some View {
        TabView (selection:$navManager.activeTab) {
            
            NavigationStack (path: $navManager.lenderNavPath){
                PiLenderDashboard()
                
                // Handle all possible lender's screens here
                    .navigationDestination(for: PiNavInfo.self) { piInfo in
                        let routeId = PiDeepLink(rawValue: piInfo.routeId)
                        switch routeId {
                        case .lender_transaction:
                            PiTransactionListView(params: ["source":"lender"] )
                        case .transaction_detail:
                            if let dict = piInfo.dict {
                                PiTransactionDetail(params: dict)
                            }
                        default:
                            PiLenderDashboard()
                        }
                    }
            }.tabItem {
                Label("Lender", systemImage: PiTabInfo.lender.symbolImage)
            }.tag(PiTabInfo.lender)
            
            NavigationStack (path: $navManager.borrowerNavPath){
                PiBorrowerDashboard()
                
                // Handle all possible borrower's screens here
                    .navigationDestination(for: PiNavInfo.self) { piInfo in
                        let routeId = PiDeepLink(rawValue: piInfo.routeId)
                        switch routeId {
                        case .borrower_transaction:
                            PiTransactionListView(params: ["source":"borrower"])
                        case .transaction_detail:
                            if let dict = piInfo.dict {
                                PiTransactionDetail(params: dict)
                            }
                        default:
                            PiBorrowerDashboard()
                        }
                    }
            }.tabItem {
                Label("Borrower", systemImage: PiTabInfo.borrower.symbolImage)
            }.tag(PiTabInfo.borrower)
            
            Text("Notification")
                .tabItem {
                    
                    Label("Notification", systemImage: PiTabInfo.borrower.symbolImage)
                }.tag(PiTabInfo.notification)
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: PiTabInfo.settings.symbolImage)
                }.tag(PiTabInfo.settings)
        }
    }
}

#Preview {
    DashboardView()
}
