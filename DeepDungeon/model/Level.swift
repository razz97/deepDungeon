//
//  Level.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit


class Level {
    
    var experience: Int = 0
    var expLevel: Int = 100
    var currentLevel: Int = 1
    private let ADD_LEVEL_EXP: Int = 30
    
    func add(experience: Int) -> Bool {
        self.experience += experience
        if (experience >= expLevel) {
            currentLevel += 1
            self.experience = self.experience - expLevel
            expLevel += ADD_LEVEL_EXP
            return true
        }
        return false
    }
}
