//
//  Dungeon.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation

class Dungeon {
    
    var monsters: [[Monster]] = []
    
    init(monsters: [Monster]) {
        for monster in monsters {
            self.monsters[monster.hardness].append(monster)
        }
    }
}
