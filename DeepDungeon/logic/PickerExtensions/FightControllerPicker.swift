//
//  FightControllerPicker.swift
//  DeepDungeon
//
//  Created by Alex on 27/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

extension FightController: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView.tag == HERO_TAG ? hero.dices : monster.dices
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerHeight
    }
}
extension FightController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let img = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: allWidths/3, height: 60)))
        let imgName: String = "dice\((row+1))\(pickerView.tag == HERO_TAG ? "" : "U")"
        img.image =  UIImage(named:imgName)
        img.contentMode = .scaleAspectFit
        return img
    }
}
