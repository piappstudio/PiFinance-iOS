//
//  File.swift
//  
//
//  Created by Boobalan on 7/10/23.
//

import Foundation

class LoginViewModel:ObservableObject {
    @Published var userName:String = ""
    @Published var password:String = ""
    @Published var isLoading:Bool = false
    init() {
    }
}
