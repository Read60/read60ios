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
    var restManager = RestManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Test code for getting all students////////////
//        restManager.get("students") {
//            results in
//        
//            if results.isEmpty {
//            return
//            } else {
//                let test = results[0]["firstName"] as! String
//                print(test)
//                
//            }
//        }
        /////////////////////////////////////////////////
        
        // Test code for getting one student/////////////
//        restManager.getById("students", id: 15) {
//            results in
//            
//           // print(results["firstName"] as! String)
//        }
        /////////////////////////////////////////////////
        
        // Test code for adding one student//////////////
//        let testAdd: AnyObject = [
//            "firstName" : "Tester",
//            "lastName" : "Testington"
//        ]
//        restManager.post("students", object: testAdd) {
//            results in
//            print(results)
//        }
        /////////////////////////////////////////////////
        
        // Test code for deleting a student//////////////
//        let testDelete: AnyObject = [
//            "id" : "43",
//            "firstName" : "Tester",
//            "lastName" : "Testington"
//        ]
//        restManager.delete("students", object: testDelete)
        /////////////////////////////////////////////////
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(NewRunViewController) {
            if let newRunViewController = segue.destinationViewController as? NewRunViewController {
                newRunViewController.managedObjectContext = managedObjectContext
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if(isLoggedIn != 1){
            self.performSegueWithIdentifier("goto_login", sender: self)
        }else{
        }
    }
    
    
    @IBAction func profileTapped(sender: UIButton) {
        
        
    }
}