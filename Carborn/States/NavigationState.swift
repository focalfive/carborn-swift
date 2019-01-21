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
    case brand
    case car
}

struct NavigationState: StateType, Equatable {
    var path: NavigationPath
    var value: String?
    init() {
        path = .root
    }
}

extension NavigationState {
    static func ==(lhs: NavigationState, rhs: NavigationState) -> Bool {
        return lhs.path == rhs.path && lhs.value == rhs.value
    }
}
