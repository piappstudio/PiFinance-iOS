//
//  File.swift
//  
//
//  Created by Boobalan on 7/13/23.
//

import Foundation

public struct PiTransaction: Identifiable, Codable, Hashable{
    
    
    public var name:String? = nil
    public var date:String? =  nil
    public var amount:Double? = nil
    public var transactionId:String = ""
    public var id:String {
        return transactionId
    }
    
    public init() {

    }
    public init(name:String?, date:String?, amount:Double?, transactionId:String) {
        self.name = name
        self.date = date
        self.amount = amount
        self.transactionId = transactionId
    }
    
    
    public static func lendersTransaction() -> [PiTransaction] {
        var transactions = [PiTransaction]()
        for txn in 1...100 {
            transactions.append(PiTransaction(name:  "Online transaction: \(txn)",
                                date : "02/\(txn%31)/2023",
                                            amount : Double(txn*30), transactionId : "Txn Id: xxx-xxx-xxx\(txn)"))
        }
    
        return transactions
    } 
    public static func borrowerTransaction() -> [PiTransaction] {
        var transactions = [PiTransaction]()
        for txn in 1...100 {
            transactions.append(PiTransaction(name:  "Received From: Pi Finance \(txn)",
                                date : "02/\(txn%31)/2023",
                                            amount : Double(txn*25), transactionId : "Txn Id: xxx-xxx-xxx\(txn)"))
        }
    
        return transactions
    }
}
