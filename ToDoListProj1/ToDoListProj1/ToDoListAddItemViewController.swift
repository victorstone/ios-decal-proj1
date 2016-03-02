//
//  ToDoListAddItemViewController.swift
//  ToDoListProj1
//
//  Created by Victor Stone on 2/29/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import UIKit

class ToDoListAddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var toDoUserInput: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var toDoItem = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if self.toDoUserInput.text != nil && self.toDoUserInput.text != ""{
            self.toDoItem = self.toDoUserInput.text!
        }

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
