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
    
    //pifin://lender
    //pifin://borrower
    // pifin://lender/lender_transaction
    case lender_transaction = "lender_transaction"
    // pifin://borrower/borrower_transaction
    case borrower_transaction = "borrower_transaction"
    // For Lender's transaction detail:
    // pifin://lender/transaction_detail?name=Kroger&transactionId=455&date=July%2014%202023
    // For Borrower's transaction detail:
    // pifin://borrower/transaction_detail?name=Citi&transactionId=345&date=July%2014%202023
    case transaction_detail = "transaction_detail"
    
}
