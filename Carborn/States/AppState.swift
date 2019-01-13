//
//  AppState.swift
//  Carborn
//
//  Created by pureye4u on 04/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var navigationState: NavigationState
    var carState: CarState
    var menuState: MenuState
}
