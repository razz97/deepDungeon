//
//  Hero.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

internal class Hero: Fighter {
    
    var name: String
    var image: UIImage
    var level: Level
    var stuff: Stuff
    var gold: Int
    var startingLife: Int
    var currentLife: Int
    var defeated: [Monster] = []
    var type: heroes
    var bonus: [bonuses:Int] = [:]
    var attack: Int { return stuff.attack * bonus[bonuses.attack]! + level.currentLevel }
    var magic: Int { return stuff.magic * bonus[bonuses.magic]! + level.currentLevel }
    var luck: Int { return stuff.luck * bonus[bonuses.luck]! + level.currentLevel }
    var defense: Int { return stuff.defense  * bonus[bonuses.defense]! + level.currentLevel } 
    var dices: Int {
        let result = attack + magic + luck + defense
        if result < 250 { return 1 }
        return result < 500 ? 2 : 3
    }
    
    enum heroes { case wizard, sorcerer, archer, warrior }
    enum bonuses { case attack, magic, defense, luck }
    
    init(type:heroes,name:String,image:UIImage,level:Level,gold:Int,startingLife:Int,stuff:Stuff) {
        self.name = name
        self.image = image
        self.level = level
        self.gold = gold
        self.startingLife = startingLife
        self.currentLife = startingLife
        self.stuff = stuff
        self.type = type
        self.genBonuses()
    }
    
    convenience init() {
        self.init(type: heroes.archer,name:"",image:UIImage(),level:Level(),gold:0,startingLife:0,stuff:Stuff(items: []))
    }
    
    func defeatMonster(monster: Monster) -> Bool {
        gold += monster.money
        if (level.add(experience: monster.experience)) {
            if startingLife < 5 { startingLife += 1 }
            return true
        }
        return false
    }
    
    func buy(item: Item) -> Bool {
        if gold < item.price {
            return false
        }
        gold -= item.price
        stuff.add(item: item)
        return true
    }
    
    private func genBonuses() {
        bonus[bonuses.magic] = 1
        bonus[bonuses.attack] = 1
        bonus[bonuses.defense] = 1
        bonus[bonuses.luck] = 1
        switch type {
        case .archer: bonus[bonuses.attack] = 3
        case .wizard: bonus[bonuses.magic] = 3
        case .sorcerer: bonus[bonuses.luck] = 3
        case .warrior: bonus[bonuses.defense] = 3
        }
    }
    
}
