//
//  HomeViewController.swift
//
//
//  Created by Vincent Conde
//  Copyright (c) 2015 Celebrity Publishing. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(NewRunViewController) {
            if let newRunViewController = segue.destinationViewController as? NewRunViewController {
                newRunViewController.managedObjectContext = managedObjectContext
            }
        }
    }
}