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
    
    func getAttack() -> Int {
        var result: Int = 10
        for item in items.values {
            result += item.attack
        }
        return result
    }
    
    func getDefense() -> Int {
        var result: Int = 10
        for item in items.values {
            result += item.defense
        }
        return result
    }
    
    func getMagic() -> Int {
        var result: Int = 10
        for item in items.values {
            result += item.magic
        }
        return result
    }
    
    func getLuck() -> Int {
        var result: Int = 10
        for item in items.values {
            result += item.luck
        }
        return result
    }
    
}
