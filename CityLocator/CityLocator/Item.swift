//
//  Item.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 29/07/2024.
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