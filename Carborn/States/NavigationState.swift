//
//  NavigationState.swift
//  Carborn
//
//  Created by pureye4u on 04/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

enum NavigationPath {
    case root
}

struct NavigationState: StateType {
    var path: NavigationPath
}