//
//  ServiesViewController.swift
//  siyman
//
//  Created by John Peden on 4/2/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ServiesViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nsURL = NSURL(string: "https://siyman.squarespace.com/services/")
        let requestObj = NSURLRequest(URL: nsURL!)
        webView.loadRequest(requestObj)
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
