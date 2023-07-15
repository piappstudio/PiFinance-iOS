//
//  PiTabInfo.swift
//  PiFinance
//
//  Created by Boobalan on 7/13/23.
//

import Foundation

public enum PiTabInfo:String, CaseIterable {
    case lender  = "lender"
    case borrower = "borrower"
    case notification = "notification"
    case settings = "settings"
    
    public var symbolImage:String  {
        switch self {
        case .lender:
            return "dollarsign.arrow.circlepath"
        case .borrower: return "dollarsign.circle"
        case .notification: return  "bell"
        case .settings: return "gearshape"
            
        }
    }
    
    public static func convert(from:String)->String? {
        return PiTabInfo.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }?.rawValue
    }
}
