//
//  Hero.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

internal class Hero {
    
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
    
    
    func defend(attack: Int) -> Bool {
        self.currentLife -= attack
        return self.currentLife > 0
    }
    
    func attack() -> Int {
        var result = 0
        for item in stuff.items.values {
            result += item.attack * bonus[bonuses.attack]!
            result += item.magic * bonus[bonuses.magic]!
            result += item.defense * bonus[bonuses.defense]!
            result += item.luck * bonus[bonuses.luck]!
        }
        return result
    }
    
    func genBonuses() {
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
    
    func getAttack() -> Int {
        return stuff.getAttack() * bonus[bonuses.attack]!
    }
    
    func getMagic() -> Int {
        return stuff.getMagic() * bonus[bonuses.magic]!
    }
    
    func getLuck() -> Int {
        return stuff.getLuck() * bonus[bonuses.luck]!
    }
    
    func getDefense() -> Int {
        return stuff.getDefense()  * bonus[bonuses.defense]!
    }
    
    func getView() -> UIView {
        let view: UIView = UIView()
        
        
        
        return view
    }
    
}
