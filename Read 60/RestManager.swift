//
//  RestManager.swift
//  Read 60
//
//  Created by Michael Villar on 12/27/15.
//  Copyright © 2015 Celebrity Publishing. All rights reserved.
//

import Foundation

class RestManager {
    
    // 'root' will need to contain "https" in the future
    // Added temp code in Info.plist to allow no https
    var root: String = "http://services.read60.com/"
    
    init() {}
    init(root: String) {
        self.root = root
    }
    
    func get(endPoint: String, resultHandler:(results:Array<AnyObject>)->()) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: root + endPoint)!
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let result = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(result)
                    
                    // Parse the JSON to get all objects
                    let jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! Array<AnyObject>
                    
                    resultHandler(results: jsonArray)
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
    
    func getById(endPoint: String, id: Int, resultHandler:(results:AnyObject)->()) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: root + endPoint + "/" + String(id))!
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let result = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(result)
                    
                    // Parse the JSON to get all objects
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) 
                    
                    resultHandler(results: jsonObject)
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
    
    func post(endPoint: String, resultHandler:(results:String)->()) {
        
    }
}
