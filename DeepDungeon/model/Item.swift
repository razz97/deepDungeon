//
//  Item.swift
//  DeepDungeon
//
//  Created by Alex Bou on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    // Types of items available
    enum types: CaseIterable {
        case body // armor, cap
        case handheld // arrow, sword, scepter, shield
        case boots
        case helmet
        case ring
        case potion
    }
    
    // General
    let name: String
    let type: types
    let image: UIImage
    let price: Int
    
    // Stats for user
    let attack: Int
    let defense: Int
    let luck: Int
    let magic: Int
    
    init(name:String,type:types,image:UIImage,price:Int,attack:Int,defense:Int,luck:Int,magic:Int) {
        self.name = name
        self.type = type
        self.image = image
        self.price = price
        self.attack = attack
        self.defense = defense
        self.luck = luck
        self.magic = magic
    }
    
    
}
