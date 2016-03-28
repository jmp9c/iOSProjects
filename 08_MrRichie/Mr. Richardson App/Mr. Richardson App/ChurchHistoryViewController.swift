//
//  ChurchHistoryViewController.swift
//  Mr. Richardson App
//
//  Created by John Peden on 3/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit
import SafariServices

class ChurchHistoryViewController: UIViewController {
    
    let q1 = "http://churchhistory.misterrichardson.com/classnotes1.html"
    let q2 = "http://churchhistory.misterrichardson.com/classnotes2.html"
    let q3 = "http://churchhistory.misterrichardson.com/classnotes3.html"
    let q4 = "http://churchhistory.misterrichardson.com/classnotes4.html"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNotes(sender: UIButton) {
        
        print("\(sender.titleLabel!)")
        switch sender.titleLabel!.text! {
        case "Show 1st Quarter Notes": showPage(q1)
        case "Show 2nd Quarter Notes": showPage(q2)
        case "Show 3rd Quarter Notes": showPage(q3)
        case "Show 4th Quarter Notes": showPage(q4)
        default: print("Error in Church History VC")
        }
        
    }
   
    
    func showPage(URLAsString: String) {
        if let url = NSURL(string: URLAsString) {
            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(vc, animated: true, completion: nil)
        }
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
