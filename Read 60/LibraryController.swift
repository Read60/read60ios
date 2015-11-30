//
//  LibraryController.swift
//  Read 60
//
//  Created by Vincent on 11/29/15.
//  Copyright © 2015 Celebrity Publishing. All rights reserved.
//

import UIKit

class LibraryController: UITableViewController {

    var library = [String]()
    var add: NSString = "Fail"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUsers()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.library.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var item: String
        item = library[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
    
    
    
    func getUsers() {
        let urlPath = "https://read60rest-read60.rhcloud.com/students/3"
        let url = NSURL(string: urlPath)!
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url, completionHandler:
            {(data:NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                    if let ipString = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                        
                        self.library = ["test1", "test2", "test3", ipString as String]
                
                }
                
        }).resume()
    }
}
