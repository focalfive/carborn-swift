//
//  BrandService.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import FirebaseDatabase
import RxSwift

class BrandService {
    static let shared = BrandService()
    
    internal let reference = Database.database().reference()
    internal var collectionSubject = BehaviorSubject<[Brand]>(value: [])
    
    init() {
        reference.child("brands").observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot.value)
        }) { error in
            print(error.localizedDescription)
        }
    }
    
    func get() -> Observable<[Brand]> {
        return collectionSubject.asObserver()
    }
    
}
