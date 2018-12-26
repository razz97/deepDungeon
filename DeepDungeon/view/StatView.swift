//
//  StatView.swift
//  DeepDungeon
//
//  Created by Alex on 23/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

class StatView: UIView {
    
    var img: UIImageView = UIImageView()
    var val: UILabel = UILabel()
    var name: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    convenience init(frame: CGRect,img: UIImage) {
        self.init(frame: frame)
        self.img.image = img
    }
    
    func setupViews() {
        let margin: CGFloat = frame.height * 0.05
        let width: CGFloat = frame.width - 2*margin
        let height: CGFloat = frame.height - 2*margin
        let allWidth: CGFloat = width * 0.5
        img = UIImageView(frame: CGRect(origin: CGPoint(x:margin , y:margin), size: CGSize(width: allWidth, height: height)))
        img.contentMode = .scaleAspectFit
        val = UILabel(frame: CGRect(origin: CGPoint(x:margin + allWidth, y:margin), size: CGSize(width: allWidth, height: height)))
        val.textColor = UIColor.white
        val.font = .systemFont(ofSize: 20)
        val.adjustsFontSizeToFitWidth = true;
        addSubview(img)
        addSubview(val)
    }
    
    func setData(val: Int) {
        self.val.text = String(val)
    }
}
