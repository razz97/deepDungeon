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
    
    var cont: UIView = UIView()
    
    var image: UIImageView = UIImageView()
    var life: LifeView = LifeView()
    var hit: UILabel = UILabel()
    
    var imageWidth: CGFloat = 0
    var otherWidth: CGFloat = 0
    
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
        imageWidth = frame.width * 0.4
        otherWidth = frame.width * 0.6
        setAutosizedContainer()
        addBackground()
        addLife()
        addImage()
        addHit()
        addSubview(cont)
    }
    
    func addLife() {
        life = LifeView(frame: CGRect(origin: CGPoint(x: imageWidth,y:0), size: CGSize(width: otherWidth, height: cont.frame.height * 0.5)))
        cont.addSubview(life)
    }
    
    func addImage() {
        image = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: imageWidth, height: cont.frame.height)))
        image.contentMode = .scaleAspectFit
        cont.addSubview(image)
    }
    
    func addHit() {
        hit = UILabel(frame: CGRect(origin: CGPoint(x: imageWidth,y:cont.frame.height * 0.5), size: CGSize(width: otherWidth, height: cont.frame.height * 0.5)))
        hit.textColor = .white
        hit.text = "Attack: 0"
        cont.addSubview(hit)
    }
    
    func addBackground() {
        let background: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: frame.width, height: frame.height)))
        background.image = UIImage(named: "back_heroe")
        addSubview(background)
    }
    
    func setData(fighter: Fighter) {
        life.setHearts(amount: fighter.currentLife)
        image.image = fighter.image
    }
    
    func setAutosizedContainer() {
        let verMargin: CGFloat = frame.height * 0.1
        let horMargin: CGFloat = frame.width * 0.05
        let usableWidth = frame.width - 2*horMargin
        let usableHeight = frame.height - 2*verMargin
        cont = UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
        imageWidth = cont.frame.width * 0.4
        otherWidth = cont.frame.width  * 0.6
    }
    
    func setAttack(attack: Int) {
        hit.text = "Attack: \(attack)"
    }

}
