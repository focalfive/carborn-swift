//
//  NavigationReducer.swift
//  Carborn
//
//  Created by pureye4u on 04/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

func navigationReducer(action: Action, state: NavigationState?) -> NavigationState {
    var state = state ?? NavigationState(path: .root)
    
    switch action {
    case let action as NavigationAction:
        state.path = action.path
    default:
        break
    }
    
    return state
}
