//
//  SignUpViewController.swift
//  Read 60
//
//  Created by Michael Villar on 2/10/16.
//  Copyright © 2016 Celebrity Publishing. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var restManager = RestManager();
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!

    @IBAction func signUpTapped(sender: UIButton) {
        
        
        let firstName:NSString = txtFirstName.text! as NSString
        let lastName:NSString = txtLastName.text! as NSString
        let email:NSString = txtEmail.text! as NSString
        let username:NSString = txtUsername.text! as NSString
        let password:NSString = txtPassword.text! as NSString
      
        
        var student: AnyObject = [
            "firstName" : firstName,
            "lastName" : lastName            
        ]
        
        var credentials: AnyObject = [
            "username" : username,
            "password" : password,
            "email" : email,
            "student" : student
            
        ]
       

//        restManager.post("students", object: student) {
//            results in
//           
//            print("TESTING SOMETHING")
//            print(results)
//            
//
//            
      //  }
        //            let credentials: AnyObject = [
        //                "username" : username,
        //                "password" : password,
        //                "email" : email,
        //                "student" : {
        //                    "id" : results["id"],
        //                    "firstName" : results["firstName"]
        //                }
        //            ]
        //
        
        restManager.post("register", object: credentials) {
            results in
            
        }
    
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
