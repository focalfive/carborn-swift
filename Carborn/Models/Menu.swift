//
//  Menu.swift
//  Carborn
//
//  Created by pureye4u on 12/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import Foundation

struct Menu {
    var id: String = UUID().uuidString
    var name: String = ""
    var parentMenuId: String?
    var carId: String?
}
