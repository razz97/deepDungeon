//
//  StatsView.swift
//  DeepDungeon
//
//  Created by Alex on 23/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class StatsView: UIView {
    
    var name: UILabel = UILabel()
    var stats: [String:StatView] = [:]
    var background: UIImageView = UIImageView()
    var life: LifeView = LifeView()
    var margin: CGFloat = 0
    var allHeights: CGFloat = 0
    var allWidths: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,hero: Hero) {
        self.init(frame: frame)
        setData(hero: hero)
    }

    func setupViews() {
        setSizes()
        addBackground()
        addStats()
        addName()
        addLife()
    }
    
    func setData(hero: Hero) {
        stats["damage"]!.setData(val: hero.getAttack())
        stats["magic"]!.setData(val: hero.getMagic())
        stats["money"]!.setData(val: 0)
        stats["defense"]!.setData(val: hero.getDefense())
        stats["luck"]!.setData(val: hero.getLuck())
        stats["xp"]!.setData(val: 0)
        name.text = hero.name
        life.setHearts(amount: hero.startingLife)
    }
    
    func addBackground() {
        background = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
    }
    
    func addStats() {
        stats = [
            "damage": StatView(frame: CGRect(origin: CGPoint(x:margin,y: allHeights + margin), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"damage")!),
            "magic": StatView(frame: CGRect(origin: CGPoint(x:margin + allWidths,y:allHeights + margin), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"magic")!),
            "money": StatView(frame: CGRect(origin: CGPoint(x:margin + 2 * allWidths, y:allHeights + margin), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"money")!),
            "defense": StatView(frame: CGRect(origin: CGPoint(x:margin, y:allHeights + margin + allHeights), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"defense")!),
            "luck": StatView(frame: CGRect(origin: CGPoint(x:margin + allWidths, y:allHeights + margin + allHeights), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"luck")!),
            "xp": StatView(frame: CGRect(origin: CGPoint(x:margin + 2 * allWidths, y:allHeights + margin + allHeights), size: CGSize(width: allWidths, height: allHeights)),img:UIImage(named:"xp")!)
        ]
        for stat in stats.values { addSubview(stat) }
    }
    
    func addName() {
        name = UILabel(frame: CGRect(origin: CGPoint(x:margin,y:margin), size: CGSize(width: allWidths, height: allHeights)))
        name.textColor = UIColor.white
        name.font = .systemFont(ofSize: 30)
        name.adjustsFontSizeToFitWidth = true
        addSubview(name)
    }
    
    func addLife() {
        life = LifeView(frame: CGRect(origin: CGPoint(x:margin + allWidths,y:margin), size: CGSize(width: 2 * allWidths, height: allHeights)))
        addSubview(life)
    }
    
    func setSizes() {
        margin = frame.height * 0.2
        allHeights = (frame.height - 2*margin) * 0.33
        allWidths = (frame.width - 2*margin) * 0.33
    }
    
    func deleteBackground() {
        background.removeFromSuperview()
    }
    
}
