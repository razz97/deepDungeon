//
//  ShopController.swift
//  DeepDungeon
//
//  Created by Alex on 24/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class ShopController: UIViewController {
   
    var cont: UIView = UIView()
    
    let CATEGORY_TAG: Int = 0
    let ITEM_TAG: Int = 1
    
    var categorySelected: Shop.category = Shop.category.body
    var itemSelected: Item = dao.items[0]
    
    var itemPicker: UIPickerView = UIPickerView()
    var categoryPicker: UIPickerView = UIPickerView()
    var gold: StatView = StatView()
    
    var allWidths: CGFloat = 0
    var headerHeight: CGFloat = 0
    var itemPickerHeight: CGFloat = 0
    var categoryPickerHeight: CGFloat = 0
    var buyButtonHeight: CGFloat = 0
    
    var popup: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setAutosizedContainer()
        addViewsToContainer()
        view.addSubview(cont)
        view.backgroundColor = UIColor(red: 50/255, green: 42/255, blue: 54/255, alpha: 1)
    }
    
    func addViewsToContainer() {
        addHeader()
        addCategoryPicker()
        addItemPicker()
        addBuyButton()
        addGoldView()
        updateSelected()
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
    
    func addHeader() {
        let header: HeaderView = HeaderView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: allWidths, height: headerHeight)))
        header.back.addTarget(self, action: #selector(onBackPress), for: .touchUpInside)
        header.setTitle(title: "Shop")
        cont.addSubview(header)
    }
    
    func addBuyButton() {
        let button: UIButton = UIButton(frame: CGRect(origin: CGPoint(x:allWidths*0.15,y:headerHeight + categoryPickerHeight + itemPickerHeight), size: CGSize(width: allWidths*0.7, height: buyButtonHeight)))
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  .systemFont(ofSize: 20)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(onBuyPress), for: .touchUpInside)
        cont.addSubview(button)
    }
    
    func addGoldView() {
        gold = StatView(frame: CGRect(origin: CGPoint(x:allWidths*0.6,y:headerHeight + categoryPickerHeight*0.25), size: CGSize(width: allWidths*0.3, height: categoryPickerHeight*0.5)),img: UIImage(named: "money")!)
        gold.setData(val: hero.gold)
        cont.addSubview(gold)
    }
    
    func updateSelected() {
        pickerView(categoryPicker, didSelectRow: 0, inComponent: 0)
        pickerView(itemPicker, didSelectRow: 0, inComponent: 0)
    }
    
    @objc func onBackPress(sender: UIButton) {
        performSegue(withIdentifier: "backShop", sender: self)
    }
    
    @objc func onBuyPress(sender: UIButton) {
        showInfo(success:hero.buy(item: itemSelected))
        gold.setData(val: hero.gold)
    }
    
    func showInfo(success: Bool) {
        popup = UILabel(frame: CGRect(x: view.frame.width*0.2, y: view.frame.height*0.45, width: view.frame.width*0.6, height: view.frame.height*0.1))
        popup.backgroundColor = success ? .green : .red
        popup.text = success ? "You bought \(itemSelected.name)!" : "Not enough funds :("
        popup.textAlignment = .center
        popup.layer.masksToBounds = true
        popup.layer.cornerRadius = 30
        view.addSubview(popup)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }
    
    @objc func dismissAlert(){
        popup.removeFromSuperview()
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
