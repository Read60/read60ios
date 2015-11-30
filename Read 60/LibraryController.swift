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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.library = ["test1", "test2", "test3"]
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
}
