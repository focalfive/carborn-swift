//
//  Action.swift
//  Carborn
//
//  Created by pureye4u on 04/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

struct NavigationAction: Action {
    let path: NavigationPath
    let value: String?
    
    init(path: NavigationPath, value: String? = nil) {
        self.path = path
        self.value = value
    }
}

struct CarActionUpdated: Action {
    let collection: [Car]
}

struct MenuAction: Action {
    let menu: [String]
}
