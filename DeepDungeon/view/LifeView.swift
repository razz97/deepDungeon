//
//  LifeView.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class LifeView: UIView {
    
    var hearts: [UIImageView] = []
    var empty: UIImage = UIImage(named:"heart_empty")!
    var filled: UIImage = UIImage(named:"heart_filled")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,amount: Int) {
        self.init(frame: frame)
        setHearts(amount: amount)
    }
    
    func setupViews() {
        let margin = frame.height * 0.05
        let height = frame.height - 2 * margin
        let allWidths = (frame.width - 2 * margin) * 0.2
        for i in 1...5 {
            let tmp: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(x: margin + allWidths * CGFloat(i - 1),y:margin), size: CGSize(width: allWidths, height: height)))
            tmp.image = empty
            hearts.append(tmp)
            self.addSubview(tmp)
        }
    }
    
    func setHearts(amount: Int) {
        for i in 0...4 { hearts[i].image = empty }
        if amount > 0 && amount <= 5 {
            for i in 0..<amount {
                hearts[i].image = filled
            }
        }
    }
}
