//
//  ToDoListModel.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 3/1/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation

class ToDoListModel {
    var toDoListItems: Array<ToDoItem>
    var completedToDoItemIndices: Set<Int>
    var numCompletedItems: Int
    
    init() {
        toDoListItems = [ToDoItem]()
        completedToDoItemIndices = Set<Int>()
        numCompletedItems = 0
    }
    //alternate constructor for testing purposes... If I wanted to preload datat or something I guess
    init(preconstructedToDoList: Array<ToDoItem>, preconstructedCompletedToDoItemIndices: Set<Int>, predeterminedNumCompletedItems: Int) {
        toDoListItems = preconstructedToDoList
        completedToDoItemIndices = preconstructedCompletedToDoItemIndices
        numCompletedItems = 0
    }
    
    func getItemAtIndex(index: Int) -> ToDoItem {
        return toDoListItems[index]
    }
    
    func removeAtIndex(index: Int) -> Int {
        toDoListItems.removeAtIndex(index)
        return index
    }
    
    func append(itemToAppend: ToDoItem) {
        toDoListItems.append(itemToAppend)
    }
    
    func count() -> Int {
        return toDoListItems.count
    }
    
    func incrementNumCompletedItems() {
        numCompletedItems += 1
    }
    
    func decrementNumCompletedItems() {
        numCompletedItems -= 1
    }
    
    func getNumCompletedItems() -> Int {
        return numCompletedItems
    }
    
}