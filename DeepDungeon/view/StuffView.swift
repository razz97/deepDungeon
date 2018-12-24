//
//  StuffView.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class StuffView: UIView {
    
    var items: [Shop.category : UIImageView] = [:]
    var emptyItem: UIImage = UIImage(named: "empty_item")!
    var itemWidth: CGFloat = 0
    var itemHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,stuff: Stuff) {
        self.init(frame: frame)
        setData(stuff: stuff)
    }
    
    func setupViews() {
        setItemSize()
        let size: CGSize = CGSize(width: itemWidth, height: itemHeight)
        items[Shop.category.helmet] = UIImageView(frame: CGRect(origin: CGPoint(x: itemWidth, y:0), size: size))
        items[Shop.category.shield] = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y:itemHeight), size: size))
        items[Shop.category.body] = UIImageView(frame: CGRect(origin: CGPoint(x: itemWidth, y:itemHeight), size: size))
        items[Shop.category.handheld] = UIImageView(frame: CGRect(origin: CGPoint(x: 2*itemWidth, y:itemHeight), size: size))
        items[Shop.category.boots] = UIImageView(frame: CGRect(origin: CGPoint(x: itemWidth, y:2*itemHeight), size: size))
        for item in items.values {
            item.image = emptyItem
            addSubview(item)
        }
    }
    
    func setItemSize() {
        itemWidth = frame.width / 3
        itemHeight = frame.height / 3
    }
    
    func setData(stuff: Stuff) {
        for item in stuff.items.values {
            items[item.type]!.image = item.image
        }
    }
    
}
