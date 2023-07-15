//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/14/23.
//

import SwiftUI
import PiModel


public struct PiTransactionDetail: View {
    public init(params: [String : String?]) {
        self.params = params
    }
    var params:[String:String?]

    public var body: some View {

        if let data = params["data"], let transData = data {
            let transaction = JsonCoder.decode(type: PiTransaction.self, from: transData)
            VStack (alignment:.leading, spacing: 10) {
                PiTransactionRow(key: "Id", value: transaction?.transactionId ?? "")
                PiTransactionRow(key: "Detail", value: transaction?.name ?? "")
                PiTransactionRow(key: "Amount", value: transaction?.amount?.toString() ?? "")
                PiTransactionRow(key: "Transaction Date", value: transaction?.date ?? "")
                Spacer()
            }.padding()
           
        } else {
            Text("No details are found!")
        }
    
        
    }
}

struct PiTransactionRow: View {
    var key:String
    var value:String
    
    var body: some View {
        HStack {
            Text(key).font(.headline).frame(alignment: .leading)
            Spacer()
            Text(value).font(.subheadline).frame(alignment: .trailing)
        }
    }
}

struct PiTransactionDetailPreview:PreviewProvider {
    static var previews: some View {
        
        let transaction = PiTransaction(name: "Kroger Transaction", date: "07/14/2023", amount: 100.23, transactionId: "1233")
    
        
        PiTransactionDetail(params: ["title":"BorrowTransaction Details", "data":JsonCoder.encode(type: transaction) ?? ""])
    }
}
