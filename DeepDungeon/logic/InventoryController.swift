//
//  InventoryController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class InventoryController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stuffHeight = cont.frame.height * 0.5
        let statsHeight = cont.frame.height * 0.3
        addHeader(segueId: "backInventory",title:"Inventory")
        cont.addSubview(StuffView(frame:CGRect(origin: CGPoint(x:0,y:headerHeight), size: CGSize(width: allWidths, height: stuffHeight)),stuff:hero.stuff))
        cont.addSubview(StatsView(frame:CGRect(origin: CGPoint(x:0,y:headerHeight + stuffHeight), size: CGSize(width: allWidths, height: statsHeight)),hero: hero))
    }
}
