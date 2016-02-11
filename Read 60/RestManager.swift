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
    var root: String = "http://read60rest-read60.rhcloud.com/"
    var token: String = ""
    
    init() {}
    init(token:String, root: String) {
        self.token = token
        self.root = root
    }
    
    // GET REQUEST: returns list of entities depending on endPoint
    func get(endPoint: String, resultHandler:(results:Array<AnyObject>)->()) {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = ["Authorization" : "Bearer 61ebc8f9cd9a42be9cd5417d126d5173"]
        let session = NSURLSession(configuration: config)
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
    
    //GET REQUEST: returns single entity by ID depending on endPoint
    func getById(endPoint: String, id: Int, resultHandler:(results:AnyObject)->()) {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = ["Authorization" : "Bearer 61ebc8f9cd9a42be9cd5417d126d5173"] // Need a way to store this code and use it in this service
        let session = NSURLSession(configuration: config)
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
                    
//                    if(endPoint == "students") {
//                        let student = Mapper<Student>().map(result)
//                        resultHandler(results: student!)
//                    }
                    
                     //Parse the JSON to get all objects
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    
                    resultHandler(results: jsonObject)
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
    
    // POST REQUEST: creates entity depending on endPoint; returns ID of created object
    func post(endPoint: String, object: AnyObject, resultHandler:(results:AnyObject)->()) {
        // Setup the session to make REST POST call
        let url = NSURL(string: root + endPoint)!
        let session = NSURLSession.sharedSession()
        //let postParams : [String: AnyObject] = object as! [String : AnyObject]
        //let postParams : [String: AnyObject] = ["hello": object]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(object, options: NSJSONWritingOptions())
            print(object)
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("POST: " + postString)
            }
            
            
            
        }).resume()
    }
    
    // DELETE REQUEST: deletes entity depending on endPoint using object passed
    func delete(endPoint: String, object: AnyObject) {
        // Setup the session to make REST POST call
        let url = NSURL(string: root + endPoint)!
        let session = NSURLSession.sharedSession()
        //let postParams : [String: AnyObject] = object as! [String : AnyObject]
        //let postParams : [String: AnyObject] = ["hello": object]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "DELETE"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(object, options: NSJSONWritingOptions())
            print(object)
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
        }).resume()
    }
}
