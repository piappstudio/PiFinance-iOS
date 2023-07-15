//
//  SwiftUIView.swift
//
//
//  Created by Boobalan on 7/12/23.
//

import SwiftUI
import PiModel
import PiNavigation

public struct PiTransactionListView: View {
    var params:[String:String?]
    
    private var transactions:[PiTransaction] = [PiTransaction]()
    
    public init(params: [String : String?]) {
        self.params = params
        // Read the source from dict and access the data accordinlgy
        if let source = params["source"] {
            if source == "lender" {
                transactions = PiTransaction.lendersTransaction()
            } else {
                transactions = PiTransaction.borrowerTransaction()
            }
        }
    }
    
    public var body: some View {
        
        List(transactions) { transaction in
            let data = JsonCoder.encode(type: transaction)!
            let detailParams = ["data":data]
            
            // Convert it into PiNavInfo object so that we can pass the value through the deeplink too
            NavigationLink(value: PiNavInfo(routeId: PiDeepLink.transaction_detail.rawValue, dict: detailParams)) {
                HStack {
                    VStack {
                        if let date = transaction.date {
                            Text(date)
                                .font(.caption).frame(maxWidth: .infinity, alignment: .leading)
                            if let name = transaction.name {
                                Text (name).font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                    }.padding()
                    if let amount = transaction.amount {
                        Spacer()
                        Text (String(format: "$ %.2f", amount)).font(.headline).fontWeight(.bold)
                    }
                }
                
            }
            
        } 
       
    }
}

struct PiTransactionListViewPreview:PreviewProvider {
    static var previews: some View {
        PiTransactionListView(params: ["source":"ledger"])
    }
}
