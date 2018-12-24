//
//  HeroView.swift
//  DeepDungeon
//
//  Created by Alex Bou on 21/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class HeroView: UIButton {
    
    var img: UIImageView = UIImageView()
    var stats: StatsView = StatsView()
    var background: UIImageView = UIImageView()
    var hero: Hero = Hero()
    
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
        addBackground()
        addStats()
        addImage()
        disableSubviewInteraction()
    }
    
    func addImage() {
        img = UIImageView(frame: CGRect(origin: CGPoint(x: frame.height * 0.1, y: 0), size: CGSize(width: frame.width*0.20, height: frame.height)))
        img.contentMode = .scaleAspectFit
        addSubview(img)
    }
    
    func disableSubviewInteraction() {
        stats.isUserInteractionEnabled = false
        img.isUserInteractionEnabled = false
        background.isUserInteractionEnabled = false
    }
    
    func addStats() {
        stats = StatsView(frame: CGRect(origin: CGPoint(x: frame.width*0.2, y: 0), size: CGSize(width: frame.width*0.8, height: frame.height)))
        stats.deleteBackground()
        addSubview(stats)
    }
    
    func addBackground() {
        background = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
    }
    
    func setData(hero: Hero) {
        self.hero = hero
        img.image = hero.image
        stats.setData(hero: hero)
    }
}
