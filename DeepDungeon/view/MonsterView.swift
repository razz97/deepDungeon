//
//  MonsterView.swift
//  DeepDungeon
//
//  Created by Alex on 26/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class MonsterView: UIView {
    
    var image: UIImageView = UIImageView()
    var life: LifeView = LifeView()
    var name: UILabel = UILabel()
    var stats: [String:StatView] = [:]
    var margin: CGFloat = 0
    var nameHeight: CGFloat = 0
    var statHeight: CGFloat = 0
    var allWidths: CGFloat = 0
    var height: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,monster: Monster) {
        self.init(frame: frame)
        setData(monster: monster)
    }
    
    func setupViews() {
        setSizes()
        addBackground()
        addStats()
        addName()
        addImage()
        addLife()
    }
    
    func addBackground() {
        let background: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
    }
    
    func addStats() {
        stats = [
            "damage": StatView(frame: CGRect(origin: CGPoint(x:margin + allWidths, y: nameHeight + margin), size: CGSize(width: allWidths, height: statHeight)),img:UIImage(named:"damage")!),
            "money": StatView(frame: CGRect(origin: CGPoint(x:margin + 2 * allWidths, y:nameHeight + margin), size: CGSize(width: allWidths, height: statHeight)),img:UIImage(named:"money")!),
            "xp": StatView(frame: CGRect(origin: CGPoint(x:margin + 3 * allWidths, y:nameHeight + margin), size: CGSize(width: allWidths, height: statHeight)),img:UIImage(named:"xp")!)
        ]
        for stat in stats.values { addSubview(stat) }
    }
    
    func addName() {
        name = UILabel(frame: CGRect(origin: CGPoint(x:margin + allWidths,y:margin), size: CGSize(width: allWidths, height: nameHeight)))
        name.textColor = UIColor.white
        name.font = .systemFont(ofSize: 30)
        name.adjustsFontSizeToFitWidth = true
        addSubview(name)
    }
    
    func addLife() {
        life = LifeView(frame: CGRect(origin: CGPoint(x:margin + 2*allWidths,y:margin), size: CGSize(width: 2*allWidths, height: nameHeight)))
        addSubview(life)
    }
    
    func addImage() {
        image = UIImageView(frame: CGRect(origin: CGPoint(x:margin*0.6,y:margin), size: CGSize(width: allWidths, height: height)))
        image.contentMode = .scaleAspectFit
        addSubview(image)
    }
    
    func setSizes() {
        margin = frame.height * 0.2
        statHeight = (frame.height - 2*margin) * 0.4
        nameHeight = (frame.height - 2*margin) * 0.6
        allWidths = (frame.width - 2*margin) * 0.25
        height = (frame.height - 2*margin)
    }
    
    func setData(monster: Monster) {
        stats["damage"]!.setData(val: monster.attack)
        stats["money"]!.setData(val: monster.money)
        stats["xp"]!.setData(val: monster.experience)
        name.text = monster.name
        name.textColor = monster.hardness
        life.setHearts(amount: monster.startLife)
        image.image = monster.image
    }
}
