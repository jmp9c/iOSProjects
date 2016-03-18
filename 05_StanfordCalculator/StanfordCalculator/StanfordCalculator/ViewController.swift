//
//  ViewController.swift
//  StanfordCalculator
//
//  Created by John Peden on 3/18/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Begin Calculator */

    @IBOutlet weak var display: UILabel! // Main Display
    var userIsInTheMiddleOfTypingANumber = false

    
    @IBAction func calcButtonPressed(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        
    }

    @IBAction func enter() {
        
    }
}

