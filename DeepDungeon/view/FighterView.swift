//
//  FighterView.swift
//  DeepDungeon
//
//  Created by Alex on 26/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class FighterView: UIView {
    
    var image: UIImageView = UIImageView()
    var life: LifeView = LifeView()
    var hit: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,fighter: Fighter) {
        self.init(frame: frame)
        setData(fighter: fighter)
    }
    
    func setupViews() {
        addLife()
        addImage()
        addHit()
    }
    
    func addLife() {
        
    }
    
    func addImage() {
    
    }
    
    func addHit() {
        
    }
    
    func setData(fighter: Fighter) {
        
    }
}
