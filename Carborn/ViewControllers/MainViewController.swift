//
//  MainViewController.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    internal var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        MenuService.shared.get().subscribe {
            print("Subscribe RX menu", $0.element)
        }.disposed(by: bag)
        
    }
    
}
