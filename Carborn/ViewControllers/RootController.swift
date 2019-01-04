//
//  RootController.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import UIKit
import ReSwift

class RootController: UINavigationController, StoreSubscriber {
    typealias StoreSubscriberStateType = NavigationState
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        self.init(rootViewController: MainViewController())
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        navigationBar.isHidden = true
        mainStore.subscribe(self) {
            $0.select {
                $0.navigationState
            }
        }
    }
    
    func newState(state: NavigationState) {
        print("newState", state.path)
        switch state.path {
        case .root:
            popToRootViewController(animated: true)
        }
    }
    
}
