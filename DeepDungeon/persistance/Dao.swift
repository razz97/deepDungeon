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
    
    private let items: [Item] = [
        // Body: Armors and caps
        Item(name: "Silk Armor", type: Shop.category.body, image: UIImage(named: "silk_armour")!, price: 600, attack: 0, defense: 10, luck: 10, magic: 0),
        Item(name: "Iron Armor", type: Shop.category.body, image: UIImage(named: "iron_armour")!, price: 1500, attack: 0, defense: 30, luck: 10, magic: 0),
        Item(name: "Steel Armor", type: Shop.category.body, image: UIImage(named: "steel_armour")!, price: 2500, attack: 0, defense: 50, luck: 10, magic: 0),
        Item(name: "Simple Cap", type: Shop.category.body, image: UIImage(named: "simple_cap")!, price: 500, attack: 0, defense: 0, luck: 5, magic: 10),
        Item(name: "Enchanted Cap", type: Shop.category.body, image: UIImage(named: "enchanted_cap")!, price: 1300, attack: 0, defense: 0, luck: 10, magic: 20),
        Item(name: "Epic Cap", type: Shop.category.body, image: UIImage(named: "epic_cap")!, price: 2700, attack: 0, defense: 0, luck: 15, magic: 50),
        
        // HandHelds: Bow, Scepter, Shield, Sword
        Item(name: "Wood Bow", type: Shop.category.handheld, image: UIImage(named: "wood_arrow")!, price: 800, attack: 25, defense: 0, luck: 0, magic: 0),
        Item(name: "Metal Bow", type: Shop.category.handheld, image: UIImage(named: "metal_arrow")!, price: 1400, attack: 35, defense: 0, luck: 10, magic: 0),
        Item(name: "Diamond Bow", type: Shop.category.handheld, image: UIImage(named: "diamond_arrow")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        Item(name:"Enchanted Scepter",type:Shop.category.handheld, image: UIImage(named: "enchanted_scepter")!,price:2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Lucky Scepter", type: Shop.category.handheld, image: UIImage(named: "lucky_scepter")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Simple Scepter", type: Shop.category.handheld, image: UIImage(named: "simple_scepter")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        Item(name: "Magic Shield", type: Shop.category.shield, image: UIImage(named: "magic_shield")!, price: 2000, attack: 10, defense: 10, luck: 10, magic: 50),
        Item(name: "Iron Shield", type: Shop.category.shield, image: UIImage(named: "light_shield")!, price: 2000, attack: 50, defense: 10, luck: 10, magic: 10),
        Item(name: "Defensive Shield", type: Shop.category.shield, image: UIImage(named: "defensive_shield")!, price: 2000, attack: 10, defense: 50, luck: 10, magic: 10),
        
        Item(name: "Diamond Sword", type: Shop.category.handheld, image: UIImage(named: "diamond_sword")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Fire Sword", type: Shop.category.handheld, image: UIImage(named: "fire_sword")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Simple Sword", type: Shop.category.handheld, image: UIImage(named: "simple_sword")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        // Boots
        Item(name: "Simple Boots", type: Shop.category.boots, image: UIImage(named: "simple_boots")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Reinforced Boots", type: Shop.category.boots, image: UIImage(named: "reinforced_boots")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        
        // Helmets
        Item(name: "Copper Helmet", type: Shop.category.helmet, image: UIImage(named: "copper_helmet")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Iron Helmet", type: Shop.category.helmet, image: UIImage(named: "iron_helmet")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),
        Item(name: "Silk Helmet", type: Shop.category.helmet, image: UIImage(named: "silk_helmet")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20)
    ]
    let heroes: [Hero] = [
        Hero(type: Hero.heroes.warrior, name: "Warrior", image: UIImage(named: "warrior")!, level: Level(), gold: 0, startingLife: 5, stuff: Stuff(items: [Item(name: "Diamond Bow", type: Shop.category.handheld, image: UIImage(named: "diamond_arrow")!, price: 2000, attack: 20, defense: 20, luck: 20, magic: 20),])),
        Hero(type: Hero.heroes.archer, name: "Archer", image: UIImage(named: "archer")!, level: Level(), gold: 0, startingLife: 3, stuff: Stuff(items: [])),
        Hero(type: Hero.heroes.wizard, name: "Wizard", image: UIImage(named: "wizard")!, level: Level(), gold: 0, startingLife: 4, stuff: Stuff(items: [])),
    ]
    private let monsters: [Monster] = [
        Monster(attack: 50, name: "Aragog", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "aragog")!),
        Monster(attack: 50, name: "Dron", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "dron")!),
        Monster(attack: 50, name: "Heracross", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "heracross")!),
        Monster(attack: 50, name: "Homunculus", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "homunculus")!),
        Monster(attack: 50, name: "Krabby", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "krabby")!),
        Monster(attack: 50, name: "Paras", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "paras")!),
        Monster(attack: 50, name: "Rat", life: 50, hardness: Monster.Hardness.low, money: 100, experience: 50, image: UIImage(named: "rat")!),
        
        Monster(attack: 100, name: "Murloc", life: 100, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "murloc")!),
        Monster(attack: 100, name: "Ninja", life: 100, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "ninja")!),
        Monster(attack: 100, name: "Sabertooth", life: 100, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "sabertooth")!),
        Monster(attack: 100, name: "Valeera", life: 100, hardness: Monster.Hardness.medium, money: 200, experience: 100, image: UIImage(named: "valeera")!),
    
        Monster(attack: 150, name: "Beeking", life: 200, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "beeking")!),
        Monster(attack: 150, name: "Brambleback", life: 200, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "brambleback")!),
        Monster(attack: 150, name: "Golem", life: 200, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "golem")!),
        Monster(attack: 150, name: "Mecathun", life: 200, hardness: Monster.Hardness.high, money: 300, experience: 150, image: UIImage(named: "mecathun")!),
    ]
    
    // These are for having a nice interface for accessing monsters and items
    let dungeon: Dungeon
    let shop: Shop
    
    //Unique instance of this class
    private static var instance: Dao?;
    
    init() {
        // Generate them here
        self.dungeon = Dungeon(monsters: monsters)
        self.shop = Shop(allItems: items)
    }
    
  
}
