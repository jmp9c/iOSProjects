//
//  TableViewController.swift
//  ToDoList
//
//  Created by John Peden on 6/21/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  var toDoList = ["Go to School", "Go home", "Program apps", "Not sleep"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    tableView.reloadData()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return toDoList.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    
    // Configure the cell...
    cell.textLabel?.text = toDoList[indexPath.row]
    
    return cell
  }
  
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      // Delete the row from the data source
      toDoList.removeAtIndex(indexPath.row)
      tableView.reloadData()
      
    } else if editingStyle == .Insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
  
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    if fromIndexPath != toIndexPath {
      let object = toDoList[fromIndexPath.row]
      toDoList.removeAtIndex(fromIndexPath.row)
      toDoList.insert(object, atIndex: toIndexPath.row)
      tableView.reloadData()
    }
    
  }
  
  @IBAction func edit(sender: UIBarButtonItem) {
    self.editing = true
  }
  
  @IBAction func add(sender: UIBarButtonItem) {
    let ac = UIAlertController(title: "New Item", message: nil, preferredStyle: .Alert)
    ac.addTextFieldWithConfigurationHandler(nil)
    
    let submitAction = UIAlertAction(title: "Submit", style: .Default) { [unowned self, ac] (action: UIAlertAction!) in
      let answer = ac.textFields![0]
      self.toDoList.insert(answer.text!, atIndex: 0)
      self.tableView.reloadData()
    }
    ac.addAction(submitAction)
    presentViewController(ac, animated: true, completion: nil)
  }
  
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
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
