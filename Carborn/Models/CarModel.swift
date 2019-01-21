//
//  CarModel.swift
//  Carborn
//
//  Created by pureye4u on 20/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import Foundation

struct CarModel {
    var id: String = UUID().uuidString
    var name: String?
    init(name: String) {
        self.name = name
    }
}
