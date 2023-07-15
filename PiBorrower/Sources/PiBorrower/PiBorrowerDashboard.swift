//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/13/23.
//

import SwiftUI
import PiAuthentication
import PiNavigation

public struct PiBorrowerDashboard: View {
    @EnvironmentObject var router:PiNavigationManager
    
    @State var isShowSheet = false
    
    public init() {
        
    }
    public var body: some View {
        ZStack {
            VStack {
                Text("Borrower Dashboard")
                Button   {
                    router.borrowerNavPath.append(PiNavInfo(routeId: PiDeepLink.borrower_transaction.rawValue, dict: nil))
                    
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

struct PiBorrowerDashboardPreview:PreviewProvider {
    static var previews: some View {
        PiBorrowerDashboard().environmentObject(PiNavigationManager())
    }
}

