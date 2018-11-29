//
//  Dice.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Dice {
    
    var value: Int
    
    init() {
        self.value = Int.random(in: 1...6)
    }
    
}
