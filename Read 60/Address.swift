//
//  Address.swift
//  Read 60
//
//  Created by Michael Villar on 12/30/15.
//  Copyright © 2015 Celebrity Publishing. All rights reserved.
//

import Foundation

class Address: Mappable {
    
    var street: String?
    var city: String?
    var state: String?
    var zip: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        street  <- map["street"]
        city    <- map["city"]
        state   <- map["state"]
        zip     <- map["zip"]
    }
}