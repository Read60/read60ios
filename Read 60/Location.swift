//
//  Location.swift
//
//
//  Created by Vincent Conde
//  Copyright (c) 2015 Celebrity Publishing. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var timestamp: NSDate
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var run: NSManagedObject

}
