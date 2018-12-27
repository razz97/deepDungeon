//
//  Stuff.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Stuff {
    
    var items: [Shop.category : Item] = [:]
    
    init(items: [Item]) {
        for item in items { self.items[item.type] = item }
    }
    
    func add(item: Item) {
        items[item.type] = item
    }
    
    var attack: Int {
        var result: Int = 1
        for item in items.values {
            result += item.attack
        }
        return result
    }
    
    var defense: Int {
        var result: Int = 1
        for item in items.values {
            result += item.defense
        }
        return result
    }
    
    var magic: Int {
        var result: Int = 1
        for item in items.values {
            result += item.magic
        }
        return result
    }
    
    var luck: Int {
        var result: Int = 1
        for item in items.values {
            result += item.luck
        }
        return result
    }
}
