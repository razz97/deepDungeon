//
//  DungeonControllerPicker.swift
//  DeepDungeon
//
//  Created by Alex on 27/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

extension DungeonController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return view != nil ? view! : MonsterView(frame: CGRect(origin: CGPoint(), size: CGSize(width: allWidths, height: 130)),monster: dao.monsters[row])
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
    }
    
}
