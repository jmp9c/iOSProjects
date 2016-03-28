//
//  BibleDoctrineViewController.swift
//  Mr. Richardson App
//
//  Created by John Peden on 3/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit
import SafariServices


class BibleDoctrineViewController: UIViewController, SFSafariViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPage() {
        if let url = NSURL(string: "http://bibledoctrine.misterrichardson.com/bibledocnotes.html") {
            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func showClassNotes() {
        showPage()
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
