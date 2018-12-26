//
//  Dao.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

var dao:Dao = Dao()

class Dao {
    
    // These three fields to be replaced by any persistent storage system
    
    let items: [Item] = [
        // Body: Armors and caps
        Item(name: "Silk Armor", type: Shop.category.body, image: "silk_armour", price: 600, attack: 0, defense: 10, luck: 10, magic: 0),
        Item(name: "Iron Armor", type: Shop.category.body, image: "iron_armour", price: 1500, attack: 0, defense: 30, luck: 10, magic: 0),
        Item(name: "Steel Armor", type: Shop.category.body, image: "steel_armour", price: 2500, attack: 0, defense: 50, luck: 10, magic: 0),
        Item(name: "Simple Cap", type: Shop.category.body, image: "simple_cap", price: 500, attack: 0, defense: 0, luck: 5, magic: 10),
        Item(name: "Enchanted Cap", type: Shop.category.body, image: "enchanted_cap", price: 1300, attack: 0, defense: 0, luck: 10, magic: 20),
        Item(name: "Epic Cap", type: Shop.category.body, image: "epic_cap", price: 2700, attack: 0, defense: 0, luck: 15, magic: 50),
        
        // HandHelds: Bow, Scepter, Shield, Sword
        Item(name: "Wood Bow", type: Shop.category.handheld, image: "wood_arrow", price: 800, attack: 25, defense: 0, luck: 0, magic: 0),
        Item(name: "Metal Bow", type: Shop.category.handheld, image: "metal_arrow", price: 1400, attack: 35, defense: 0, luck: 10, magic: 0),
        Item(name: "Diamond Bow", type: Shop.category.handheld, image: "diamond_arrow", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        Item(name:"Enchanted Scepter",type:Shop.category.handheld, image: "enchanted_scepter",price:2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Lucky Scepter", type: Shop.category.handheld, image:" lucky_scepter", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Simple Scepter", type: Shop.category.handheld, image: "simple_scepter", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        Item(name: "Magic Shield", type: Shop.category.shield, image: "magic_shield", price: 2000, attack: 10, defense: 10, luck: 10, magic: 50),
        Item(name: "Iron Shield", type: Shop.category.shield, image: "light_shield", price: 2000, attack: 50, defense: 10, luck: 10, magic: 10),
        Item(name: "Defensive Shield", type: Shop.category.shield, image: "defensive_shield", price: 2000, attack: 10, defense: 50, luck: 10, magic: 10),
        
        Item(name: "Diamond Sword", type: Shop.category.handheld, image: "diamond_sword", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Fire Sword", type: Shop.category.handheld, image: "fire_sword", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Simple Sword", type: Shop.category.handheld, image: "simple_sword", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        // Boots
        Item(name: "Simple Boots", type: Shop.category.boots, image: "simple_boots", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Reinforced Boots", type: Shop.category.boots, image: "reinforced_boots", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        // Helmets
        Item(name: "Copper Helmet", type: Shop.category.helmet, image: "copper_helmet", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Iron Helmet", type: Shop.category.helmet, image: "iron_helmet", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Silk Helmet", type: Shop.category.helmet, image: "silk_helmet", price: 2000, attack: 20, defense: 20, luck: 20, magic: 20)
    ]
    let heroes: [Hero] = [
        Hero(type: Hero.heroes.warrior, name: "Warrior", image: UIImage(named: "warrior")!, level: Level(), gold: 5000, startingLife: 5, stuff: Stuff(items: [])),
        Hero(type: Hero.heroes.archer, name: "Archer", image: UIImage(named: "archer")!, level: Level(), gold: 0, startingLife: 3, stuff: Stuff(items: [])),
        Hero(type: Hero.heroes.wizard, name: "Wizard", image: UIImage(named: "wizard")!, level: Level(), gold: 0, startingLife: 4, stuff: Stuff(items: [])),
    ]
    let monsters: [Monster] = [
        Monster(attack: 50, name: "Aragog", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "aragog")!),
        Monster(attack: 50, name: "Dron", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "dron")!),
        Monster(attack: 50, name: "Heracross", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "heracross")!),
        Monster(attack: 50, name: "Homunculus", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "homunculus")!),
        Monster(attack: 50, name: "Krabby", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "krabby")!),
        Monster(attack: 50, name: "Paras", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "paras")!),
        Monster(attack: 50, name: "Rat", life: 3, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "rat")!),
        
        Monster(attack: 100, name: "Murloc", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "murloc")!),
        Monster(attack: 100, name: "Ninja", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "ninja")!),
        Monster(attack: 100, name: "Sabertooth", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "sabertooth")!),
        Monster(attack: 100, name: "Valeera", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "valeera")!),
    
        Monster(attack: 150, name: "Beeking", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "beeking")!),
        Monster(attack: 150, name: "Brambleback", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "brambleback")!),
        Monster(attack: 150, name: "Golem", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "golem")!),
        Monster(attack: 150, name: "Mecathun", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "mecathun")!),
    ]
    
    // These are for having a nice interface for accessing monsters and items
    let shop: Shop
    
    //Unique instance of this class
    private static var instance: Dao?;
    
    init() {
        // Generate them here
        self.shop = Shop(allItems: items)
    }
      
}
