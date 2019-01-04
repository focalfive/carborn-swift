//
//  MainReducer.swift
//  Carborn
//
//  Created by pureye4u on 04/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import ReSwift

func mainReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        navigationState: navigationReducer(action: action, state: state?.navigationState)
    )
}
