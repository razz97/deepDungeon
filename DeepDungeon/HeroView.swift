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
    
    var img: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 100, height: 200)))
    
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
        
    }
    
    func setData(hero: Hero) {
        
    }
}
