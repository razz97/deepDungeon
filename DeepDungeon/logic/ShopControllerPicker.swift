//
//  ShopControllerExtension.swift
//  DeepDungeon
//
//  Created by Alex on 25/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

extension ShopController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if (view != nil) {
            return view!
        }
        if (pickerView.tag == ITEM_TAG) {
            return ItemView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: allWidths, height: 130)), item: dao.shop.items[categorySelected]![row])
        }
        return getCategoryView(index: row)
    }
    
    func getCategoryView(index: Int) -> UILabel {
        let label: UILabel = UILabel(frame: CGRect(origin: CGPoint(x:allWidths*0.25,y:0), size: CGSize(width: allWidths*0.5, height: 50)))
        label.text = Shop.category(index: index)!.rawValue
        label.textColor = .white
        label.backgroundColor = UIColor(red: 55/255, green: 27/255, blue: 43/255, alpha: 1) //#391C2C
        label.textAlignment = .center
        return label
    }
}

extension ShopController: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == ITEM_TAG) {
            return dao.shop.items[categorySelected]!.count
        }
        return Shop.category.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if (pickerView.tag == ITEM_TAG) {
            return 130
        }
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == ITEM_TAG) {
            itemSelected = dao.shop.items[categorySelected]![row]
        } else {
            changeCategory(index: row)
        }
    }
    
    func changeCategory(index: Int) {
        categorySelected = Shop.category(index: index)!
        itemPicker.reloadAllComponents()
        itemPicker.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(itemPicker, didSelectRow: 0, inComponent: 0)
    }
}
