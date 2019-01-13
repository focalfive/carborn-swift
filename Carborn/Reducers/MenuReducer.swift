//
//  MenuReducer.swift
//  Carborn
//
//  Created by pureye4u on 12/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

func menuReducer(action: Action, state: MenuState?) -> MenuState {
    var state = state ?? MenuState(menu: [], collection: [])
    
    switch action {
    case let action as MenuAction:
        state.menu = action.menu
    default:
        break
    }
    
    return state
}
