//
//  File.swift
//  
//
//  Created by Boobalan on 7/11/23.
//

import Foundation
/**
 This class will maintain the deeplink that can be passed to destination with parameters.
 
 @parameters can be a json string
 */
public struct PiNavInfo: Hashable{
    public var routeId:String = ""
    public var dict:[String:String]? = nil
    public init(routeId: String, dict: [String:String]? = nil) {
        self.routeId = routeId
        self.dict = dict
    }
}

public enum PiDeepLink: String, CaseIterable {
    case signIn = "signin"
    case otp = "otp"
    case signUp = "signUp"
    case lender_transaction = "lender_transaction"
    
}
