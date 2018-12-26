//
//  Fighter.swift
//  DeepDungeon
//
//  Created by Alex on 26/12/2018.
//  Copyright © 2018 Alex Bou. All rights reserved.
//

import Foundation
import UIKit

protocol Fighter {
    func getAttack() -> Int
    func getImage() -> UIImage
    func getLife() -> Int
}
