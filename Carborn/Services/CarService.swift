//
//  CarService.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import FirebaseDatabase
import RxSwift

class CarService {
    static let shared = CarService()
    
    internal var isSubscribed = false
    internal let reference = Database.database().reference()
    internal var collection = BehaviorSubject<[[String: Any]]>(value: [])
    
    init() {
        
    }
    
    func subscribe() {
        guard !isSubscribed else {
            return
        }
        reference.child("cars").observeSingleEvent(of: .value, with: { [unowned self] snapshot in
            if let array = snapshot.value as? [[String: Any]] {
                self.collection.onNext(array)
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
    
    func select<T : Equatable>(by: String, equals: [String: String] = [:]) -> Observable<[T]> {
        return collection.map {
            $0.compactMap { model in
                equals.reduce(true, { (res, args) -> Bool in
                    let (key, value) = args
                    guard res, let current = model[key] as? String else {
                        return false
                    }
                    return current == value
                }) ? model : nil
            }.reduce([], { (res, val) -> [T] in
                guard let value = val[by] as? T, res.firstIndex(of: value) == nil else {
                    return res
                }
                return res + [value]
            })
        }.asObservable()
    }
    
}
