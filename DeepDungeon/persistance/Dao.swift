//
//  Dao.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Dao {
    
    // These three lines to be replaced by any persistent storage
    private let items: [Item] = [
        // All items here
    ]
    private let heroes: [Hero.heroes:Hero] = [:
        // All heroes here
    ]
    private let monsters: [Monster] = [
        // All monsters here
    ]
    
    // These are for having a nice interface for accessing monsters and items
    let dungeon: Dungeon
    let shop: Shop
    
    init() {
        // Generate them here
        self.dungeon = Dungeon(monsters: monsters)
        self.shop = Shop(allItems: items)
    }
    
    
    
    
    
}
