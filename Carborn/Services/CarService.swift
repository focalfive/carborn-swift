//
//  CarService.swift
//  Carborn
//
//  Created by pureye4u on 05/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import FirebaseDatabase

class CarService {
    internal let reference = Database.database().reference()
    
    init() {
        reference.child("cars").observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot.value)
        }) { error in
            print(error.localizedDescription)
        }
    }
    
}
