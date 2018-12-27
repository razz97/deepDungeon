//
//  Monster.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Monster: Fighter {
    
    let name: String
    let image: UIImage
    let hardness: UIColor
    let startLife: Int
    let attack: Int
    let money: Int
    let experience: Int
    var currentLife: Int
    var dices: Int {
        if attack < 75 { return 1 }
        return attack < 125 ? 2 : 3
    }
    enum Hardness: Int {case low, medium, high }
    
    init(attack:Int,name:String,life:Int,hardness:Hardness,money:Int,experience:Int,image:UIImage) {
        self.attack = attack
        self.name = name
        self.startLife = life
        self.currentLife = life
        self.money = money
        self.experience = experience
        self.image = image
        switch (hardness) {
            case .high: self.hardness = .red
            case .low: self.hardness = .green
            case .medium: self.hardness = .orange
        }
    }
}
