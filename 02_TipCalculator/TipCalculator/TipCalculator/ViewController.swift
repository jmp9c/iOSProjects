//
//  ViewController.swift
//  TipCalculator
//
//  Created by John Peden on 3/15/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TipPercentageLabel: UILabel!
    @IBOutlet weak var TipPercentageAmmount: UILabel!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var UserAmount: UITextField!
    @IBOutlet weak var PercentageSlider: UISlider!
    @IBOutlet weak var EstEggImg: UIImageView!
    
    var PercentageAmount: Int {
            return Int(100 * PercentageSlider.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func LongPress(sender: UILongPressGestureRecognizer) {
        UserAmount.text = nil
        CalculateTipPercentageAmount()
        CalculateTotalAmount()
    }
    @IBAction func UserEditedPrice(sender: UITextField) {
        /* Compute Tip Percentage Amount */
        CalculateTipPercentageAmount()
        CalculateTotalAmount()
    }
    
    @IBAction func Slided(sender: UISlider) {
        CalculateTipPercentageAmount()
        CalculateTotalAmount()
    }
    
    func CalculateTipPercentageAmount() {
        
        TipPercentageLabel.text = "\(PercentageAmount)%"
        var uAmount = Float(UserAmount.text!)
        if (uAmount == nil) {
            uAmount = 0
        }
        let hAmount = uAmount! * Float(PercentageAmount)
        let finalAmount = hAmount / 100
        TipPercentageAmmount.text = String(format: "$%.2f", arguments: [finalAmount])
    }
    
    func CalculateTotalAmount() {
        var uAmount = Float(UserAmount.text!)
        if (uAmount == nil) {
            uAmount = 0
        }
        let hAmount = uAmount! * Float(PercentageAmount)
        let finalAmount = hAmount / 100
        
        let total = finalAmount + uAmount!
        TotalAmount.text = String(format: "$%.2f", arguments: [total])
        
    }
    
    @IBAction func EasterEgg(sender: UIPinchGestureRecognizer) {
        EstEggImg.image = UIImage(named: "Pepe_rare.png")
    }

}
