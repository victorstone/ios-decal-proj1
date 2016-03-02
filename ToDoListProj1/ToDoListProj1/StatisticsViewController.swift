//
//  StatisticsView.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 3/1/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var becauseItDidntInitializeTheButtonFirst = ""
    
    @IBOutlet weak var numTasksCompleted: UILabel!

    override func viewDidLoad() {
        numTasksCompleted.text = becauseItDidntInitializeTheButtonFirst
    }
}