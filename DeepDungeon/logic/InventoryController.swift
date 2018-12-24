//
//  InventoryController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class InventoryController: UIViewController {
    
    var cont: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setAutosizedContainer()
        addViewsToContainer()
        view.addSubview(cont)
        view.backgroundColor = UIColor(red: 50/255, green: 42/255, blue: 54/255, alpha: 1)
    }
    
    func setAutosizedContainer() {
        let verMargin: CGFloat = UIScreen.main.bounds.height * 0.1
        let horMargin: CGFloat = UIScreen.main.bounds.width * 0.05
        let usableWidth = UIScreen.main.bounds.width - 2*horMargin
        let usableHeight = UIScreen.main.bounds.height - 2*verMargin
        cont = UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
    }
    
    func addViewsToContainer() {
        let headerHeight = cont.frame.height * 0.2
        let stuffHeight = cont.frame.height * 0.5
        let statsHeight = cont.frame.height * 0.3
        let allWidths = cont.frame.width
        cont.addSubview(getHeader(width: allWidths, height: headerHeight))
        cont.addSubview(StuffView(frame:CGRect(origin: CGPoint(x:0,y:headerHeight), size: CGSize(width: allWidths, height: stuffHeight)),stuff:hero.stuff))
        cont.addSubview(StatsView(frame:CGRect(origin: CGPoint(x:0,y:headerHeight + stuffHeight), size: CGSize(width: allWidths, height: statsHeight)),hero: hero))
    }
    
    func getHeader(width: CGFloat,height: CGFloat) -> UIView {
        let header: HeaderView = HeaderView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: width, height: height)))
        
//        let header2 = UIView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: width, height: height)))
//        let title = UILabel(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: width, height: height)))
//        let back = UIButton(frame: CGRect(origin: CGPoint(x:0,y:height*0.25), size: CGSize(width: width*0.2, height: height*0.5)))
//        title.text = "Inventory"
//        title.textColor = UIColor.white
//        title.textAlignment = .center
//        title.adjustsFontSizeToFitWidth = true
//        title.font = title.font.withSize(40)
//        back.setTitle("Back", for: .normal)
        
        header.back.addTarget(self, action: #selector(onBackPress), for: .touchUpInside)
//        back.backgroundColor = UIColor.gray
//        back.layer.cornerRadius = 10
//        header.addSubview(title)
//        header.addSubview(back)
        return header
    }
    
    @objc func onBackPress(sender: UIButton) {
        performSegue(withIdentifier: "backInventory", sender: self)
    }
    

    

}
