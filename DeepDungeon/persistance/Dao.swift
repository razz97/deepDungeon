//
//  Dao.swift
//  DeepDungeon
//
//  Created by Alex on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class Dao {
    let shop: Shop
    
    init() {
        self.shop = Shop(allItems: items)
    }
    
    private let items: [Item] = [
        // Body: Armors and caps
        Item(name: "Silk Armor", type: Shop.category.body, image: "silk_armour", price: 500, attack: 5, defense: 5, luck: 5, magic: 5),
        Item(name: "Iron Armor", type: Shop.category.body, image: "iron_armour", price: 1500, attack: 5, defense: 20, luck: 5, magic: 5),
        Item(name: "Steel Armor", type: Shop.category.body, image: "steel_armour", price: 2500, attack: 10, defense: 30, luck: 10, magic: 10),
        Item(name: "Simple Cap", type: Shop.category.body, image: "simple_cap", price: 500, attack: 5, defense: 5, luck: 5, magic: 5),
        Item(name: "Enchanted Cap", type: Shop.category.body, image: "enchanted_cap", price: 2000, attack: 15, defense: 5, luck: 5, magic: 15),
        Item(name: "Epic Cap", type: Shop.category.body, image: "epic_cap", price: 3000, attack: 25, defense: 10, luck: 10, magic: 25),
        // Guns: Bow, Scepter, Sword
        Item(name: "Wood Bow", type: Shop.category.handheld, image: "wood_arrow", price: 1000, attack: 10, defense: 5, luck: 5, magic: 5),
        Item(name: "Metal Bow", type: Shop.category.handheld, image: "metal_arrow", price: 1500, attack: 20, defense: 5, luck: 5, magic: 5),
        Item(name: "Diamond Bow", type: Shop.category.handheld, image: "diamond_arrow", price: 2000, attack: 30, defense: 10, luck: 10, magic: 10),
        Item(name: "Simple Scepter",type:Shop.category.handheld, image: "simple_scepter",price: 1000, attack: 5, defense: 5, luck: 5, magic: 10),
        Item(name: "Lucky Scepter", type: Shop.category.handheld, image:"lucky_scepter", price: 1500, attack: 5, defense: 5, luck: 5, magic: 20),
        Item(name: "Enchanted Scepter", type: Shop.category.handheld, image: "enchanted_scepter", price: 2000, attack: 10, defense: 10, luck: 10, magic: 30),
        Item(name: "Simple Sword", type: Shop.category.handheld, image: "simple_sword", price: 1000, attack: 5, defense: 10, luck: 5, magic: 5),
        Item(name: "Diamond Sword", type: Shop.category.handheld, image: "diamond_sword", price: 1500, attack: 5, defense: 20, luck: 5, magic: 5),
        Item(name: "Fire Sword", type: Shop.category.handheld, image: "fire_sword", price: 3000, attack: 10, defense: 30, luck: 10, magic: 10),
        // Shields
        Item(name: "Magic Shield", type: Shop.category.shield, image: "magic_shield", price: 1500, attack: 5, defense: 5, luck: 5, magic: 20),
        Item(name: "Iron Shield", type: Shop.category.shield, image: "light_shield", price: 1500, attack: 20, defense: 5, luck: 5, magic: 5),
        Item(name: "Defensive Shield", type: Shop.category.shield, image: "defensive_shield", price: 1500, attack: 5, defense: 20, luck: 5, magic: 5),
        // Boots
        Item(name: "Simple Boots", type: Shop.category.boots, image: "simple_boots", price: 500, attack: 5, defense: 5, luck: 5, magic: 5),
        Item(name: "Reinforced Boots", type: Shop.category.boots, image: "reinforced_boots", price: 1500, attack: 10, defense: 10, luck: 10, magic: 10),
        // Helmets
        Item(name: "Copper Helmet", type: Shop.category.helmet, image: "copper_helmet", price: 1500, attack: 20, defense: 5, luck: 5, magic: 5),
        Item(name: "Iron Helmet", type: Shop.category.helmet, image: "iron_helmet", price: 1500, attack: 5, defense: 20, luck: 5, magic: 5),
        Item(name: "Silk Helmet", type: Shop.category.helmet, image: "silk_helmet", price: 1500, attack: 5, defense: 5, luck: 5, magic: 20)
    ]
    
    let heroes: [Hero] = [
        Hero(type: Hero.heroes.warrior, name: "Warrior", image: UIImage(named: "warrior")!, level: Level(), gold: 1000, startingLife: 2, stuff: Stuff(items: [])),
        Hero(type: Hero.heroes.archer, name: "Archer", image: UIImage(named: "archer")!, level: Level(), gold: 1000, startingLife: 2, stuff: Stuff(items: [])),
        Hero(type: Hero.heroes.wizard, name: "Wizard", image: UIImage(named: "wizard")!, level: Level(), gold: 1000, startingLife: 2, stuff: Stuff(items: [])),
    ]
    
    let monsters: [Monster] = [
        Monster(attack: 12, name: "Rat", life: 1, hardness: Monster.Hardness.low, money: 70, experience: 40, image: UIImage(named: "rat")!),
        Monster(attack: 17, name: "Paras", life: 1, hardness: Monster.Hardness.low, money: 70, experience: 40, image: UIImage(named: "paras")!),
        Monster(attack: 25, name: "Homunculus", life: 2, hardness: Monster.Hardness.low, money: 100, experience: 60, image: UIImage(named: "homunculus")!),
        Monster(attack: 26, name: "Krabby", life: 2, hardness: Monster.Hardness.low, money: 100, experience: 60, image: UIImage(named: "krabby")!),
        Monster(attack: 30, name: "Aragog", life: 2, hardness: Monster.Hardness.low, money: 100, experience: 60, image: UIImage(named: "aragog")!),
        Monster(attack: 46, name: "Heracross", life: 3, hardness: Monster.Hardness.low, money: 130, experience: 80, image: UIImage(named: "heracross")!),
        Monster(attack: 55, name: "Sabertooth", life: 3, hardness: Monster.Hardness.low, money: 130, experience: 80, image: UIImage(named: "sabertooth")!),
        Monster(attack: 76, name: "Dron", life: 3, hardness: Monster.Hardness.medium, money: 160, experience: 100, image: UIImage(named: "dron")!),
        Monster(attack: 90, name: "Ninja", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 150, image: UIImage(named: "ninja")!),
        Monster(attack: 100, name: "Murloc", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 150, image: UIImage(named: "murloc")!),
        Monster(attack: 109, name: "Valeera", life: 4, hardness: Monster.Hardness.medium, money: 200, experience: 150, image: UIImage(named: "valeera")!),
        Monster(attack: 131, name: "Brambleback", life: 4, hardness: Monster.Hardness.high, money: 250, experience: 175, image: UIImage(named: "brambleback")!),
        Monster(attack: 146, name: "Golem", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 200, image: UIImage(named: "golem")!),
        Monster(attack: 154, name: "Beeking", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 200, image: UIImage(named: "beeking")!),
        Monster(attack: 162, name: "Mecathun", life: 5, hardness: Monster.Hardness.high, money: 300, experience: 200, image: UIImage(named: "mecathun")!),
    ]
}
