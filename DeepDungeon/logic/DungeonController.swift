//
//  DungeonController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

var monster: Monster = dao.monsters[0]

class DungeonController: UIViewController {

    var cont: UIView = UIView()
    var picker: UIPickerView = UIPickerView()
    
    var selectedMonster: Monster = dao.monsters[0]
    
    var allWidths: CGFloat = 0
    var headerHeight: CGFloat = 0
    var pickerHeight: CGFloat = 0
    var fightHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutosizedContainer()
        addViewsToContainer()
        view.addSubview(cont)
        view.backgroundColor = UIColor(red: 50/255, green: 42/255, blue: 54/255, alpha: 1)
    }
    
    func addViewsToContainer() {
        headerHeight = cont.frame.height * 0.2
        pickerHeight = cont.frame.height * 0.7
        fightHeight = cont.frame.height * 0.1
        allWidths = cont.frame.width
        addHeader()
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
    
    func addHeader() {
        let header: HeaderView = HeaderView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: allWidths, height: headerHeight)))
        header.back.addTarget(self, action: #selector(onBackPress), for: .touchUpInside)
        header.setTitle(title: "Dungeon")
        cont.addSubview(header)
    }
    
    func addFightButton() {
        let button: UIButton = UIButton(frame: CGRect(origin: CGPoint(x:allWidths*0.15,y:headerHeight + pickerHeight), size: CGSize(width: allWidths*0.7, height: fightHeight)))
        button.setTitle("Fight", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  .systemFont(ofSize: 20)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(onFightPress), for: .touchUpInside)
        cont.addSubview(button)
    }
    
    @objc func onFightPress() {
        monster = selectedMonster
        performSegue(withIdentifier: "goFight", sender: self)
    }
    
    @objc func onBackPress(sender: UIButton) {
        performSegue(withIdentifier: "backDungeon", sender: self)
    }
    
    func setAutosizedContainer() {
        let verMargin: CGFloat = UIScreen.main.bounds.height * 0.1
        let horMargin: CGFloat = UIScreen.main.bounds.width * 0.05
        let usableWidth = UIScreen.main.bounds.width - 2*horMargin
        let usableHeight = UIScreen.main.bounds.height - 2*verMargin
        
        cont = UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
    }

}
extension DungeonController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return MonsterView(frame: CGRect(origin: CGPoint(), size: CGSize(width: allWidths, height: 130)),monster: dao.monsters[row])
    }
}

extension DungeonController: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dao.monsters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 130
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMonster = dao.monsters[row]
        print(selectedMonster.name)
    }
    
}
