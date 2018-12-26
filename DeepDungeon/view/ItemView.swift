//
//  ItemView.swift
//  DeepDungeon
//
//  Created by Alex on 25/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class ItemView: UIView {
    
    var background: UIImageView = UIImageView()
    var img: UIImageView = UIImageView()
    var stats: StatsView = StatsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,item: Item) {
        self.init(frame: frame)
        setData(item: item)
    }
    
    func setupViews() {
        addBackground()
        let margin = frame.height * 0.15
        let width = frame.width - 2 * margin
        let height = frame.height - 2 * margin
        img = UIImageView(frame: CGRect(origin: CGPoint(x:margin,y:margin), size: CGSize(width: width*0.2, height: height)))
        img.contentMode = .scaleAspectFit
        stats = StatsView(frame: CGRect(origin: CGPoint(x:frame.width*0.2,y:0), size: CGSize(width: frame.width*0.8, height: frame.height)))
        stats.deleteBackground()
        addSubview(img)
        addSubview(stats)
    }
    
    func setData(item: Item) {
        img.image = UIImage(named: "\(item.image)_shop")
        stats.setData(item: item)
    }
    
    func addBackground() {
        background = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
    }
}
