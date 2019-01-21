//
//  MainViewController.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainViewController: UIViewController {
    internal var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.size.equalTo(view)
        }
        
        tableView.dataSource = nil
        tableView.delegate = nil
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext: { name in
                mainStore.dispatch(NavigationAction(path: .brand, value: name))
            }).disposed(by: bag)
        
        let menuNames: Observable<[String]> = CarService.shared.select(by: "brand")
        menuNames.bind(to: tableView.rx.items(cellIdentifier: "MenuCell", cellType: UITableViewCell.self)) { (row, name, cell) in
            cell.textLabel?.text = name
            }.disposed(by: bag)
    }
    
    
    
}
