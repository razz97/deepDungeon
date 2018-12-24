//
//  CustomButtonView.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    var title: UILabel = UILabel()
    var back: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(frame: CGRect,title: String) {
        self.init(frame: frame)
        setTitle(title: title)
    }
    
    func setup() {
        addBack()
        addTitle()
    }
    
    func addTitle() {
        title = UILabel(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: frame.width, height: frame.height)))
        title.text = "Inventory"
        title.textColor = UIColor.white
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        title.font = .systemFont(ofSize: 35)
        addSubview(title)
    }
    
    func addBack() {
        back = UIButton(frame: CGRect(origin: CGPoint(x:0,y:frame.height*0.25), size: CGSize(width: frame.width*0.2, height: frame.height*0.5)))
        back.setTitle("Back", for: .normal)
        back.backgroundColor = UIColor.gray
        back.layer.cornerRadius = 10
        back.titleLabel?.font =  .systemFont(ofSize: 25)
        back.titleLabel?.adjustsFontSizeToFitWidth = true
        addSubview(back)
    }
    
    func setTitle(title: String) {
        self.title.text = title
    }
    
    
}
