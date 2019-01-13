//
//  CarReducer.swift
//  Carborn
//
//  Created by pureye4u on 12/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

func carReducer(action: Action, state: CarState?) -> CarState {
    var state = state ?? CarState(collection: [])
    
    switch action {
    case _ as ReSwiftInit:
        CarService.shared.subscribe()
    case let action as CarActionUpdated:
        state.collection = action.collection
    default:
        break
    }
    
    return state
}
