//
//  SignUpViewController.swift
//  Read 60
//
//  Created by Michael Villar on 2/10/16.
//  Copyright © 2016 Celebrity Publishing. All rights reserved.
//

import UIKit
import Alamofire

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
        
        let student: [String: AnyObject] = [
            "firstName" : firstName,
            "lastName" : lastName
            ]
    
        Alamofire.request(.POST, "http://read60rest-read60.rhcloud.com/students", parameters: student, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //example if there is an id
                let userId = response.objectForKey("id")!
                
                let credentials: [String: AnyObject] = [
                    "username" : username,
                    "password" : password,
                    "email" : email,
                    "student" : [
                        "id" : userId,
                        "firstName" : firstName,
                        "lastName" : lastName
                    ]
                ]
                
                Alamofire.request(.POST, "http://read60rest-read60.rhcloud.com/register", parameters: credentials, encoding:.JSON)
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
