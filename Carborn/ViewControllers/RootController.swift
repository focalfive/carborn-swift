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
    
    private var navigationStack: [(path: NavigationPath, value: String?)] = [(path: .root, value: nil)]
    
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
        
        _ = rx.didShow.bind { (viewController, animated) in
            print("RootController didShow", viewController)
            switch viewController {
            case _ as MainViewController:
                mainStore.dispatch(NavigationAction(path: .root))
            case let viewController as BrandViewController:
                mainStore.dispatch(NavigationAction(path: .brand, value: viewController.brandName))
            default:
                break
            }
        }
    }
    
    func newState(state: NavigationState) {
        print("newState navi", state.path)
        switch state.path {
        case .root:
            popToRootViewController(animated: true)
        case .brand:
            guard let brandName = state.value else {
                return
            }
            pushViewController(BrandViewController(brandName), animated: true)
        case .car:
            print("navigate to car", state.path)
        }
    }
    
}
