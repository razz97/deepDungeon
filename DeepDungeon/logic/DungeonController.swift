//
//  DungeonController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class DungeonController: BaseViewController {

    var picker: UIPickerView = UIPickerView()
    
    var selectedMonster: Monster = dao.monsters[0]
    
    var pickerHeight: CGFloat = 0
    var fightHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerHeight = cont.frame.height * 0.7
        fightHeight = cont.frame.height * 0.1
        addHeader(segueId: "backDungeon", title: "Dungeon")
        addPicker()
        addFightButton()
    }
    
    func addPicker() {
        picker = UIPickerView(frame: CGRect(origin: CGPoint(x:0,y:headerHeight), size: CGSize(width: allWidths, height: pickerHeight)))
        picker.delegate = self
        picker.dataSource = self
        pickerView(picker, didSelectRow: 0, inComponent: 0)
        cont.addSubview(picker)
    }
    
    func addFightButton() {
        let button: UIButton = UIButton(frame: CGRect(origin: CGPoint(x:allWidths*0.15,y:headerHeight + pickerHeight), size: CGSize(width: allWidths*0.7, height: fightHeight)))
        customizeButton(button: button,selector:#selector(onFightPress),title:"Fight")
        cont.addSubview(button)
    }
    
    @objc func onFightPress() {
        monster = selectedMonster
        performSegue(withIdentifier: "goFight", sender: self)
    }

}
