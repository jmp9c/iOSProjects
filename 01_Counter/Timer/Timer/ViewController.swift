//
//  ViewController.swift
//  Timer
//
//  Created by John Peden on 3/15/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonTItle: UIButton!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
            counter++
            let counterString = String(counter)
            buttonTItle.setTitle(counterString, forState: UIControlState.Normal)
    }

    @IBAction func LongPress(sender: AnyObject) {
        buttonTItle.setTitle("0", forState: UIControlState.Normal)
        counter = 0
    }
    
}

