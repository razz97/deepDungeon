//
//  FightController.swift
//  DeepDungeon
//
//  Created by Alex on 26/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class FightController: BaseViewController {
    
    var monsterPicker: UIPickerView = UIPickerView()
    var heroPicker: UIPickerView = UIPickerView()
    var heroView: FighterView = FighterView()
    var monsterView: FighterView = FighterView()
    let MONSTER_TAG = 0
    let HERO_TAG = 1
    var pickerHeight: CGFloat = 0
    var fighterHeight: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monster.currentLife = monster.startLife
        hero.currentLife = hero.startingLife
        fighterHeight = cont.frame.height * 0.2
        pickerHeight = cont.frame.height * 0.25
        addFighters()
        addAttackButton()
        addHeroPicker()
        addMonsterPicker()
    }
    
    func addFighters() {
        monsterView = FighterView(frame: CGRect(origin: CGPoint(), size: CGSize(width: allWidths, height: fighterHeight)), fighter: monster)
        heroView = FighterView(frame: CGRect(origin: CGPoint(x:0,y:fighterHeight + 2*pickerHeight), size: CGSize(width: allWidths, height: fighterHeight)), fighter: hero)
        cont.addSubview(heroView)
        cont.addSubview(monsterView)
    }
    
    func addMonsterPicker() {
        monsterPicker = UIPickerView(frame: CGRect(origin: CGPoint(x:0,y:fighterHeight), size: CGSize(width: allWidths, height: pickerHeight)))
        monsterPicker.delegate = self
        monsterPicker.dataSource = self
        monsterPicker.tag = MONSTER_TAG
        monsterPicker.isUserInteractionEnabled = false
        cont.addSubview(monsterPicker)
    }
    
    func addHeroPicker() {
        heroPicker = UIPickerView(frame: CGRect(origin: CGPoint(x:0,y:pickerHeight + fighterHeight), size: CGSize(width: allWidths, height: pickerHeight)))
        heroPicker.delegate = self
        heroPicker.dataSource = self
        heroPicker.tag = HERO_TAG
        heroPicker.isUserInteractionEnabled = false
        cont.addSubview(heroPicker)
    }
    
    func addAttackButton() {
        let button: UIButton = UIButton(frame: CGRect(origin: CGPoint(x:allWidths*0.15,y:fighterHeight*2 + pickerHeight*2 + 20), size: CGSize(width: allWidths*0.7, height: cont.frame.height*0.1)))
        customizeButton(button: button, selector: #selector(attack), title: "Attack")
        cont.addSubview(button)
    }
    
    @objc func attack() {
        let monsterDamage: Int = getMonsterDamage()
        let heroDamage: Int = getHeroDamage()
        if  monsterDamage > heroDamage {
            monsterWon()
        } else {
            playerWon()
        }
    }
    
    func getHeroDamage() -> Int {
        var heroDamage: Int = 0
        for i in 0 ..< hero.dices {
            let rand = Int.random(in: 1...12)
            heroDamage += rand
            heroPicker.selectRow((rand-1), inComponent: i, animated: true)
        }
        heroView.setAttack(attack: heroDamage)
        return heroDamage
    }
    
    func getMonsterDamage() -> Int {
        var monsterDamage: Int = 0
        for i in 0 ..< monster.dices {
            let rand = Int.random(in: 1...12)
            monsterDamage += rand
            monsterPicker.selectRow((rand-1), inComponent: i, animated: true)
        }
        monsterView.setAttack(attack: monsterDamage)
        return monsterDamage
    }

    func playerWon() {
        monster.currentLife -= 1
        monsterView.setData(fighter: monster)
        if monster.currentLife == 0 {
            let hasLeveledUp: Bool = hero.defeatMonster(monster: monster)
            let msg: String = "You defeated the monster! \n Received \(monster.money) gold and \(monster.experience) XP! \(hasLeveledUp ? "\n You are level \(hero.level.currentLevel) now.": "")"
            finish(title: hasLeveledUp ? "Level up!" : "Congratulations!", message: msg)
        }
    }
    
    func monsterWon() {
        hero.currentLife -= 1
        heroView.setData(fighter: hero)
        if hero.currentLife == 0 {
            finish(title: "Oops...", message: "The monster has defeated you")
        }
    }
    
    func finish(title: String,message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Return to dungeon", style: .default, handler: {(_:UIAlertAction) in self.performSegue(withIdentifier: "fightFinished", sender: self)})
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
