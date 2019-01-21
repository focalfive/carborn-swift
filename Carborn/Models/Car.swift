//
//  Car.swift
//  Carborn
//
//  Created by pureye4u on 12/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import Foundation
import ObjectMapper

struct Car: Mappable {
    let id: String = UUID().uuidString
    var name: String = ""
    var brand: String = ""
    var model: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["display_name"]
        brand <- map["brand"]
        model <- map["model"]
    }
}

extension Car: Equatable {
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.id == rhs.id
    }
}
