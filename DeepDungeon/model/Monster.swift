//
//  Monster.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Monster {
    let name: String
    let image: UIImage
    let hardness: Hardness
    let startLife: Int
    let attack: Int
    var currentLife: Int
    let money: Int
    let experience: Int
    
    enum Hardness {case low,medium,high}
    
    init(attack:Int,name:String,life:Int,hardness:Hardness,money:Int,experience:Int,image:UIImage) {
        self.attack = attack
        self.name = name
        self.startLife = life
        self.currentLife = life
        self.hardness = hardness
        self.money = money
        self.experience = experience
        self.image = image
    }
    
    func doAttack() -> Int {
        return attack
    }
    
    func defend(damage: Int) -> Bool {
        self.currentLife -= damage
        return currentLife >= 0
    }
}
