//
//  ViewController.swift
//  DeepDungeon
//
//  Created by Alex Bou on 28/11/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let margin: CGFloat = UIScreen.main.bounds.height * 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        let heroes: [Hero] = dao.heroes
        let cont: UIView = getAutosizedContainer()
        let heroHeight: CGFloat = cont.frame.height / CGFloat(heroes.count) - margin
        for i in 0..<heroes.count {
            cont.addSubview(
                heroes[i].getView(frame: CGRect(
                    origin: CGPoint(x: 0, y: CGFloat(i)*(heroHeight + margin)),
                    size: CGSize(width: cont.frame.width, height: heroHeight))
                )
            )
        }
        view.addSubview(cont)
    }
    
    func getAutosizedContainer() -> UIView {
        let verMargin: CGFloat = UIScreen.main.bounds.height * 0.1
        let horMargin: CGFloat = UIScreen.main.bounds.width * 0.1
        let usableWidth = UIScreen.main.bounds.width - 2*horMargin
        let usableHeight = UIScreen.main.bounds.height - 2*verMargin
        return UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
    }
    
    


}

