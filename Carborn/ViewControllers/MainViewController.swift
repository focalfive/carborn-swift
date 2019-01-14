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
    internal lazy var tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.size.equalTo(view)
        }
        
        tableView.dataSource = nil
        tableView.delegate = nil
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        
        MenuService.shared.get().bind(to: tableView.rx.items(cellIdentifier: "MenuCell", cellType: UITableViewCell.self)) { (row, element, cell) in
            print(cell)
            cell.textLabel?.text = element.name
        }.disposed(by: bag)
    }
    
    
    
}
