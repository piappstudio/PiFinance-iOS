//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/14/23.
//

import SwiftUI
import PiModel


struct PiTransactionDetail: View {
    var params:[String:String]
    

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct PiTransactionDetailPreview:PreviewProvider {
    static var previews: some View {
        PiTransactionDetail(params: ["title":"BorrowTransaction Details", "name":"" ])
    }
}
