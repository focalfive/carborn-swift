//
//  CarViewController.swift
//  Carborn
//
//  Created by pureye4u on 21/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import UIKit
import RxSwift
import ReSwift

class CarViewController : UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = CarState
    
    private var bag = DisposeBag()
    private var _brandName: String
    var brandName: String {
        get {
            return _brandName
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ brandName: String) {
        _brandName = brandName
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func newState(state: CarState) {
        print("newState car", state.collection.count)
        var newCollection: [CarModel] = []
        _ = state.collection.map {
            guard $0.brand == brandName, let modelName = $0.model, newCollection.firstIndex(where: { model -> Bool in
                model.name == modelName
            }) == nil else {
                return
            }
            newCollection.append(CarModel(name: modelName))
        }
//        collection.onNext(newCollection)
    }
}

