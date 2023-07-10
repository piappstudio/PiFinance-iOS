//
//  Item.swift
//  PiFinanace
//
//  Created by Boobalan on 7/8/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
