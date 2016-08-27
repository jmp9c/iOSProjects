//
//  ViewController.swift
//  ToDoList
//
//  Created by John Peden on 6/21/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var toDoArray = ["1", "2", "3"]
  @IBOutlet var tableView: UITableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDelegate {
  
}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    
    cell.textLabel?.text = toDoArray[indexPath.row]
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoArray.count
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    toDoArray.removeAtIndex(indexPath.row)
  }
}

