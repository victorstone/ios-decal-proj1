//
//  ToDoItem.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 2/29/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation

class ToDoItem {
    var text: String
    var completionStatus: Bool
    var timeOfCompletion: NSDate
    
    init(itemToDo: String) {
        self.text = itemToDo
        self.completionStatus = false
        self.timeOfCompletion = NSDate()
    }

}
