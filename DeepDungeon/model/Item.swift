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
    
    let name: String
    let type: Shop.category
    let image: String
    let price: Int
    let attack: Int
    let defense: Int
    let luck: Int
    let magic: Int
    
    enum stats:CaseIterable {case attack, defense, luck, magic}
    
    init(name:String,type:Shop.category,image:String,price:Int,attack:Int,defense:Int,luck:Int,magic:Int) {
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
