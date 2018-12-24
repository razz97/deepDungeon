//
//  HeroView.swift
//  DeepDungeon
//
//  Created by Alex Bou on 21/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class HeroView: UIView {
    
    var img: UIImageView = UIImageView()
    var stats: StatsView = StatsView()
    var background: UIImageView = UIImageView()
    
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
        let margin: CGFloat = frame.height * 0.15
        let height = (frame.height - 2*margin)
        let width = (frame.width - 2*margin)
        img = UIImageView(frame: CGRect(origin: CGPoint(x: margin, y: margin), size: CGSize(width: width*0.2, height: height)))
        stats = StatsView(frame: CGRect(origin: CGPoint(x: frame.width*0.2, y: 0), size: CGSize(width: frame.width*0.8, height: frame.height)))
        stats.deleteBackground()
        background = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
        addSubview(img)
        addSubview(stats)
    }
    
    func setData(hero: Hero) {
        img.image = hero.image
        stats.setData(hero: hero)
    }
}
