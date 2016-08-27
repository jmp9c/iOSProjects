
//
//  FoldingTableViewController.swift
//  FCTest
//
//  Created by John Peden on 5/20/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class FoldingTableViewController: UITableViewController {
  
  let kCloseCellHeight: CGFloat = 50 // equal or greater foregroundView height
  let kOpenCellHeight: CGFloat = 286 // equal or greater containerView height
  let kRowsCount = 3
  var cellHeights = [CGFloat]()
  
  let sections = ["Schedule", "Weather", "Bus Tracking"];
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let headView = UIView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, 20))
//    self.tableView.tableHeaderView = headView
    
    
    for _ in 0...kRowsCount {
      cellHeights.append(kCloseCellHeight)
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
//  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//    // #warning Incomplete implementation, return the number of sections
//    return 0
//  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 3
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return cellHeights[(indexPath as NSIndexPath).row]
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
    
    var duration = 0.0
    if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight { // open cell
      cellHeights[(indexPath as NSIndexPath).row] = kOpenCellHeight
      cell.selectedAnimation(true, animated: true, completion: nil)
      duration = 0.5
    } else {// close cell
      cellHeights[(indexPath as NSIndexPath).row] = kCloseCellHeight
      cell.selectedAnimation(false, animated: true, completion: nil)
      duration = 1.1
    }
    
    UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
      tableView.beginUpdates()
      tableView.endUpdates()
      }, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if cell is FoldingCell {
      let foldingCell = cell as! FoldingCell
      
      if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {
        foldingCell.selectedAnimation(false, animated: false, completion:nil)
      } else {
        foldingCell.selectedAnimation(true, animated: false, completion: nil)
      }
    }
  }
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! CustomCell
    cell.hLabel.text = sections[(indexPath as NSIndexPath).row]
    cell.cLabel.text = cell.hLabel.text
   // Configure the cell...
   
   return cell
   }
 
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
   if editingStyle == .Delete {
   // Delete the row from the data source
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   } else if editingStyle == .Insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
