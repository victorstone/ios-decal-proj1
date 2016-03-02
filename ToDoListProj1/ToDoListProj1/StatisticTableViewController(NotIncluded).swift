//
//  Statistics.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 2/29/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import UIKit

class StatisticsTableViewController: UITableViewController {

    var itemsCompletedInTwentyFourHours = [ToDoItem]()
    let dateFormatter = NSDateFormatter()
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemsCompletedInTwentyFourHours.count
            
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompletedCell", forIndexPath: indexPath) as! CompletedToDoItem

        dateFormatter.dateFormat = "h:xmm"
        cell.itemLabel.text = itemsCompletedInTwentyFourHours[indexPath.row].text
        cell.timeOfCompletion.text = dateFormatter.stringFromDate(itemsCompletedInTwentyFourHours[indexPath.row].timeOfCreation)
        return cell
    }
    

    
}
