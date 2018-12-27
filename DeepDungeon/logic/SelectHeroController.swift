//
//  ViewController.swift
//  DeepDungeon
//
//  Created by Alex Bou on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class SelectHeroController: BaseViewController {
    
    let margin: CGFloat = UIScreen.main.bounds.height * 0.05
    var heroHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroHeight = cont.frame.height / CGFloat(dao.heroes.count) - margin
        for i in 0..<dao.heroes.count {
            addHero(index: i)
        }
    }
    
    func addHero(index: Int) {
        let origin: CGPoint = CGPoint(x: 0, y: CGFloat(index)*(heroHeight + margin))
        let size: CGSize = CGSize(width: cont.frame.width, height: heroHeight)
        let hero: HeroView = HeroView(frame: CGRect(origin: origin,size: size),hero: dao.heroes[index])
        hero.addTarget(self, action: #selector(onSelectedHero), for: .primaryActionTriggered)
        cont.addSubview(hero)
    }
    
    @objc func onSelectedHero(sender: HeroView) {
        hero = sender.hero
        performSegue(withIdentifier: "heroSelected", sender: self)
    }
    
    


}

