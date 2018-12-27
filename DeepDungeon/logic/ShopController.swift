//
//  ShopController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class ShopController: BaseViewController {
    
    let CATEGORY_TAG: Int = 0
    let ITEM_TAG: Int = 1
    var categorySelected: Shop.category = Shop.category.body
    var itemSelected: Item = dao.shop.items[Shop.category.body]![0]
    var itemPicker: UIPickerView = UIPickerView()
    var categoryPicker: UIPickerView = UIPickerView()
    var gold: StatView = StatView()
    var itemPickerHeight: CGFloat = 0
    var categoryPickerHeight: CGFloat = 0
    var buyButtonHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerHeight = cont.frame.height * 0.2
        itemPickerHeight = cont.frame.height * 0.5
        addHeader(segueId: "backShop",title: "Shop")
        addCategoryPicker()
        addItemPicker()
        addBuyButton()
        addGoldView()
        pickerView(categoryPicker, didSelectRow: 0, inComponent: 0)
        pickerView(itemPicker, didSelectRow: 0, inComponent: 0)
    }
    
    func addItemPicker() {
        itemPicker = UIPickerView(frame: CGRect(origin: CGPoint(x:0,y:headerHeight + categoryPickerHeight), size: CGSize(width: allWidths, height: itemPickerHeight)))
        itemPicker.delegate = self
        itemPicker.dataSource = self
        itemPicker.tag = ITEM_TAG
        cont.addSubview(itemPicker)
    }
    
    func addCategoryPicker() {
        categoryPicker = UIPickerView(frame: CGRect(origin: CGPoint(x:0,y:headerHeight), size: CGSize(width: allWidths*0.5, height: categoryPickerHeight)))
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.tag = CATEGORY_TAG
        cont.addSubview(categoryPicker)
    }
    
    func addBuyButton() {
        let button: UIButton = UIButton(frame: CGRect(origin: CGPoint(x:allWidths*0.15,y:headerHeight + categoryPickerHeight + itemPickerHeight), size: CGSize(width: allWidths*0.7, height: cont.frame.height * 0.1)))
        customizeButton(button: button, selector: #selector(onBuyPress), title: "Buy")
        cont.addSubview(button)
    }
    
    func addGoldView() {
        gold = StatView(frame: CGRect(origin: CGPoint(x:allWidths*0.6,y:headerHeight + categoryPickerHeight*0.25), size: CGSize(width: allWidths*0.3, height: categoryPickerHeight*0.5)),img: UIImage(named: "money")!)
        gold.setData(val: hero.gold)
        cont.addSubview(gold)
    }
    
    @objc func onBuyPress(sender: UIButton) {
        let success: Bool = hero.buy(item: itemSelected)
        let alert: UIAlertController = UIAlertController(title: success ? "Success!":"Failed", message: success ? "You bought \(itemSelected.name)!" : "Not enough funds :(" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        gold.setData(val: hero.gold)
    }
}
