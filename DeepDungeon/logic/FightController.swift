//
//  FightController.swift
//  DeepDungeon
//
//  Created by Alex on 26/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class FightController: UIViewController {

    var allWidths: CGFloat = 0
    var headerHeight: CGFloat = 0
    var itemPickerHeight: CGFloat = 0
    var categoryPickerHeight: CGFloat = 0
    var buyButtonHeight: CGFloat = 0
    
    var cont: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutosizedContainer()
        addViewsToContainer()
        view.addSubview(cont)
        view.backgroundColor = UIColor(red: 50/255, green: 42/255, blue: 54/255, alpha: 1)
    }
 

    func addViewsToContainer() {
        
    }
    
    func setAutosizedContainer() {
        let verMargin: CGFloat = UIScreen.main.bounds.height * 0.1
        let horMargin: CGFloat = UIScreen.main.bounds.width * 0.05
        let usableWidth = UIScreen.main.bounds.width - 2*horMargin
        let usableHeight = UIScreen.main.bounds.height - 2*verMargin
        cont = UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
        setSizes()
    }
    
    func setSizes() {
        headerHeight = cont.frame.height * 0.2
        categoryPickerHeight = cont.frame.height * 0.2
        itemPickerHeight = cont.frame.height * 0.5
        buyButtonHeight = cont.frame.height * 0.1
        allWidths = cont.frame.width
    }
}
