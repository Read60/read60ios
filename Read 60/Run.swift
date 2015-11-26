//
//  run.swift
//
//
//  Created by Vincent Conde
//  Copyright (c) 2015 Celebrity Publishing. All rights reserved.
//

import Foundation
import CoreData

class Run: NSManagedObject {

    @NSManaged var duration: NSNumber
    @NSManaged var distance: NSNumber
    @NSManaged var timestamp: NSDate
    @NSManaged var locations: NSOrderedSet

}
