//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/10/23.
//

import SwiftUI
import PiUI
import PiNavigation


public struct PiLoginView: View {

    
    @Environment(\.dismiss) var dismiss
    
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    @EnvironmentObject var navManager:PiNavigationManager
    public init() {
        
    }
    
    public var body: some View {
        
        ZStack {
            NavigationStack(path: $navManager.authNavPath) {
                
                VStack {
                    Text("sign_title".fromLocalization(bundle: .module)).font(.title).padding()
                    
                    TextField("enter_phone_number".fromLocalization(bundle: .module), text: $loginViewModel.userName)
                        .textFieldStyle(PiOvalTextFieldStyle())
                    
                    Button {
                        navManager.authNavPath.append(PiNavInfo(routeId: PiDeepLink.otp.rawValue, dict: nil))
                    } label: {
                        Text ("continue".fromLocalization(bundle: .module)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(10)
                    }
                    
                    .buttonStyle(.borderedProminent).padding(.top, 10)
                    
                    Button {
                        navManager.authNavPath.append(PiNavInfo(routeId: PiDeepLink.signUp.rawValue, dict: nil))
                    } label: {
                        Text ("register".fromLocalization(bundle: .module))
                    }.padding(.top, 10)
                    
                    Spacer()
                        .padding()
                }.padding()
                    .navigationDestination(for: PiNavInfo.self) { navInfo in
                        let deeplink = PiDeepLink(rawValue: navInfo.routeId)
                        switch deeplink {
                        case .otp:
                            OtpViewScreen()
                        case .signUp:
                            PiRegistrationView()
                        default:
                            OtpViewScreen()
                        }
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading ) {
                            Button ("Cancel") {
                                dismiss()
                            }
                        }
                    }
            }
                
            }.padding()
        
    }
}

struct PiLoginPreviewViews: PreviewProvider {
    static var previews: some View {
        PiLoginView().environmentObject(PiNavigationManager())
    }
}

