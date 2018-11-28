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
    
    var items: [Item.types:[Item]] = [:]
    
    init(allItems: [Item]) {
        for type in Item.types.allCases {
            items[type] = []
        }
        for item in allItems {
            self.items[item.type]?.append(item)
        }
    }
}
