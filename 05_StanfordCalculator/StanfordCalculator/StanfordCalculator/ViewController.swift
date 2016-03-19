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

    @IBOutlet weak var feed: UILabel!
    @IBOutlet weak var display: UILabel! // Main Display
    var userIsInTheMiddleOfTypingANumber = false
    var operandStack = [Double]()

    
    @IBAction func calcButtonPressed(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        
    }
    
    @IBAction func clear() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.removeAll()
        display.text = "0"
        print(operandStack)
        feed.text = ""
        
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
            
        }
        
        switch operation {
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        case "÷": performOperation { $1 / $0 }
        case "×": performOperation { $0 * $1 }
        case "√": performOperation { sqrt($0) }
        case "sin": performOperation { sin($0) }
        case "cos": performOperation { cos($0) }
        case "π": performOperation { $0 * M_PI }
        default: break
        }
        
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
            
        }
        
    }
    
    @nonobjc func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
            
        }
        
    }

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        if let f = feed.text {
           feed.text = f + " " + String(displayValue)
        }
        
        print(operandStack)
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

