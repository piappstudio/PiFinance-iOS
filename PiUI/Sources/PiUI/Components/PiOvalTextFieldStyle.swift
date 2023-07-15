//
//  File.swift
//  
//
//  Created by Boobalan on 7/11/23.
//

import Foundation
import SwiftUI

public struct PiOvalTextFieldStyle: TextFieldStyle {
    public init() {
        
    }
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
