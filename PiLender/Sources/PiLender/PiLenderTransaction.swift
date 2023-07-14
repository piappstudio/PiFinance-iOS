//
//  SwiftUIView.swift
//
//
//  Created by Boobalan on 7/12/23.
//

import SwiftUI
import PiModel

public struct PiLenderTransaction: View {
    public init() {
        
    }
    public var body: some View {
        
        List(PiTransaction.transactions()) { transaction in
            NavigationLink(value: transaction) {
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
        .navigationTitle("Transaction Details")
        .navigationDestination(for: PiTransaction.self) { transaction in
            VStack {
                Text("Transaction Id: \(transaction.transactionId)")
            }.navigationTitle("Details")
            
        }
    }
}

struct PiLenderTransactionPreview:PreviewProvider {
    static var previews: some View {
        PiLenderTransaction()
    }
}
