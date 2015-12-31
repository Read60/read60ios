//
//  Student.swift
//  Read 60
//
//  Created by Michael Villar on 12/28/15.
//  Copyright © 2015 Celebrity Publishing. All rights reserved.
//

import Foundation


class Student: Entity {
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    var birthDate: NSDate?
    var gender: String?
    var age: Int?
    
    var address: Address?
    
    required init?(_ map: Map) {
        super.init(map)
        
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        firstName   <- map["firstName"]
        lastName    <- map["lastName"]
        birthDate   <- (map["birthDate"], DateTransform())
        gender      <- map["gender"]
        age         <- map["age"]
        address     <- map["address"]
    }
}