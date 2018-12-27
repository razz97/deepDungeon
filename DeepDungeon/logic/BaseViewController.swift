//
//  BaseViewController.swift
//  DeepDungeon
//
//  Created by Alex on 27/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var cont: UIView = UIView()
    var headerHeight: CGFloat = 0
    var allWidths: CGFloat = 0
    var segueId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutosizedContainer()
        headerHeight = cont.frame.height * 0.2
        allWidths = cont.frame.width
        view.backgroundColor = UIColor(red: 50/255, green: 42/255, blue: 54/255, alpha: 1)
        view.addSubview(cont)
    }
    
    func setAutosizedContainer() {
        let verMargin: CGFloat = UIScreen.main.bounds.height * 0.1
        let horMargin: CGFloat = UIScreen.main.bounds.width * 0.05
        let usableWidth = UIScreen.main.bounds.width - 2*horMargin
        let usableHeight = UIScreen.main.bounds.height - 2*verMargin
        cont = UIView(frame: CGRect(origin: CGPoint(x:horMargin,y:verMargin), size: CGSize(width: usableWidth, height: usableHeight)))
    }
    
    func addHeader(segueId: String, title: String) {
        self.segueId = segueId
        let header = UIView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: cont.frame.width, height: headerHeight)))
        let titlelbl = UILabel(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: header.frame.width, height: header.frame.height)))
        customizeLabel(label: titlelbl,text: title)
        header.addSubview(titlelbl)
        let back = UIButton(frame: CGRect(origin: CGPoint(x:0,y:header.frame.height*0.25), size: CGSize(width: header.frame.width*0.2, height: header.frame.height*0.5)))
        customizeButton(button: back, selector: #selector(onBackPress), title: "Back")
        header.addSubview(back)
        cont.addSubview(header)
    }
    
    func customizeButton(button: UIButton,selector: Selector, title: String) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  .systemFont(ofSize: 20)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    func customizeLabel(label: UILabel,text: String) {
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 35)
    }
    
    @objc func onBackPress(sender: UIButton) {
        performSegue(withIdentifier: segueId, sender: self)
    }

}
