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
    enum category: CaseIterable {
        case body // armor, cap
        case handheld // arrow, sword, scepter, shield
        case boots
        case helmet
        case shield
    }
    
    var items: [category:[Item]] = [:]
    
    init(allItems: [Item]) {
        for type in category.allCases { items[type] = [] }
        for item in allItems { self.items[item.type]?.append(item) }
    }
}
