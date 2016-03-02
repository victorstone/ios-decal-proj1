//
//  ViewController.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 2/28/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    /*
    var model = [ToDoItem]()
    var completedItems = Set<Int>()
    var numCompleteItems = 0
    */
    
    
    //I did the right thing! I hope...
    var model = ToDoListModel()
    
    //eventually add something that checks if it's been a day since you last refreshed this tableViewController
    let currentDate = NSDate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(animated: Bool) {
        for (var i = 0; i < model.count(); i++) {
            //check if completed more than 24 hours ago
            if ((model.getItemAtIndex(i).completionStatus) && (currentDate.timeIntervalSinceDate(model.getItemAtIndex(i).timeOfCompletion)/3600 >= 24)) {
                model.removeAtIndex(i)
                self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: i, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Right)
            }
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toStatisticsView") {
            let statisticsView = segue.destinationViewController as! StatisticsViewController
            for (var i = 0; i < model.count(); i++) {
                if ((model.getItemAtIndex(i).completionStatus) && (currentDate.timeIntervalSinceDate(model.getItemAtIndex(i).timeOfCompletion)/3600 > 24)) {
                    model.decrementNumCompletedItems()
                }
            }
            statisticsView.becauseItDidntInitializeTheButtonFirst = String(model.getNumCompletedItems())

        }
    }

    @IBAction func unwindCancelToToDoListTableViewController(segue: UIStoryboardSegue) {
        
    }

    @IBAction func unwindDoneToToDoListTableViewController(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! ToDoListAddItemViewController
        let toDoText = source.toDoItem
        if toDoText != "" {
            let newToDoItem = ToDoItem(itemToDo: toDoText)
            model.append(newToDoItem)
 
        }
        self.tableView.reloadData()
        

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count()
            
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoItemTableViewCell
        cell.toDoItemLabel.text = model.getItemAtIndex(indexPath.row).text
        if model.getItemAtIndex(indexPath.row).completionStatus {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let selectedItem = self.model.getItemAtIndex(indexPath.row)
        selectedItem.completionStatus = !selectedItem.completionStatus
        if selectedItem.completionStatus {
            model.completedToDoItemIndices.insert(indexPath.row)
            model.incrementNumCompletedItems()
            selectedItem.timeOfCompletion = NSDate()
            
        } else {
            if model.completedToDoItemIndices.remove(indexPath.row) != nil {
                model.decrementNumCompletedItems()
            }
        }
        tableView.reloadData()
    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            model.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }

}

