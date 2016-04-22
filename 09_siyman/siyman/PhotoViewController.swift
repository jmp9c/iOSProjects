//
//  ViewPhotographersViewController.swift
//  siyman
//
//  Created by John Peden on 4/1/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit


class ViewPhotographersViewController: UIViewController {
  @IBOutlet weak var webView: UIWebView!
  @IBOutlet weak var menuButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nsURL = NSURL(string: "https://siyman.squarespace.com/photos/")
    let requestObj = NSURLRequest(URL: nsURL!)
    webView.loadRequest(requestObj)
    if self.revealViewController() != nil {
      menuButton.target = self.revealViewController()
      menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
