//
//  BrandViewController.swift
//  Carborn
//
//  Created by pureye4u on 18/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import UIKit
import RxSwift
import ReSwift

class BrandViewController : UIViewController {
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
        
        let inset: CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        let title = UILabel()
        title.text = _brandName
        view.addSubview(title)
        title.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view).inset(inset)
            $0.width.equalTo(view)
            $0.height.equalTo(50)
        }
        
        var tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(title.snp.bottom)
            $0.bottom.equalTo(view)
            $0.width.equalTo(view)
        }
        
        tableView.dataSource = nil
        tableView.delegate = nil
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ModelCell")
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext: { name in
                print("Car model selected", name)
//                mainStore.dispatch(NavigationAction(path: .car, value: element.name))
            }).disposed(by: bag)
        
        let modelNames: Observable<[String]> = CarService.shared.select(by: "model", equals: ["brand" : brandName])
        modelNames.bind(to: tableView.rx.items(cellIdentifier: "ModelCell", cellType: UITableViewCell.self)) { (row, name, cell) in
            cell.textLabel?.text = name
            }.disposed(by: bag)
    }
}
