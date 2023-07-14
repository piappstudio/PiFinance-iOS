//
//  SwiftUIView.swift
//
//
//  Created by Boobalan on 7/12/23.
//

import SwiftUI
import PiNavigation
import PiAuthentication

public struct PiLenderDashboard: View {
    
    @EnvironmentObject var router:PiNavigationManager
    
    @State var isShowSheet = false
    
    public init() {
        
    }
    public var body: some View {
        
        ZStack {
            VStack {
                Text("Lender Dashboard")
                Button   {
                    router.lenderNavPath.append(PiNavInfo(routeId: PiDeepLink.lender_transaction.rawValue, dict:nil))
                    
                } label: {
                    Text("Transactions")
                }.padding(.top, 10).buttonStyle(.borderedProminent)
                
                Button {
                    isShowSheet = true
                } label: {
                    Text("Login")
                }.padding(.top, 10).buttonStyle(.bordered)
                    .fullScreenCover(isPresented: $isShowSheet) {
                        PiLoginView()
                    }
            }
            
        }.padding()
        
        
    }
}

struct PiLenderDashboardPreview:PreviewProvider {
    static var previews: some View {
        PiLenderDashboard().environmentObject(PiNavigationManager())
    }
}
