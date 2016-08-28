//
//  ViewController.swift
//  Fish Bowl
//
//  Created by John Peden on 8/27/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var dataFetcher: JMPDataFetcher!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    dataFetcher = JMPDataFetcher();
    dataFetcher.updateDatabase(withPhrase: "The Manning Family Band", withUser: "Noah Waycaster", withAction: "DELETE")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

