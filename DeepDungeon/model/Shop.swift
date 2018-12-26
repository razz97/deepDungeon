//
//  Shop.swift
//  DeepDungeon
//
//  Created by Alex Bou on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Shop {
    
    // Types of items available
    enum category: String, CaseIterable {
        case body = "Body"// armor, cap
        case handheld = "Guns" // arrow, sword, scepter
        case boots = "Boots"
        case helmet = "Helmets"
        case shield = "Shields"
        
        init?(index : Int) {
            switch index {
            case 0: self = .body
            case 1: self = .handheld
            case 2: self = .boots
            case 3: self = .helmet
            case 4: self = .shield
            default: return nil
            }
        }
    }
    
    var items: [category:[Item]] = [:]
    
    init(allItems: [Item]) {
        for type in category.allCases { items[type] = [] }
        for item in allItems { self.items[item.type]?.append(item) }
    }
}
