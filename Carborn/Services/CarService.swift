//
//  CarService.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import FirebaseDatabase

class CarService {
    static let shared = CarService()
    
    internal let reference = Database.database().reference()
    
    internal func subscribe() {
        reference.child("cars").observeSingleEvent(of: .value, with: { snapshot in
            if let array = snapshot.value as? [[String: Any]] {
                print("cars subscribe")
                mainStore.dispatch(CarActionUpdated(collection:array.compactMap {
                    return Car(JSON: $0)
                }))
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
    
}
