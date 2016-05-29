//
//  ViewController.swift
//  Coffee Ratio
//
//  Created by John Peden on 5/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var coffeeTF: UITextField!
  @IBOutlet var coffeeRatioTF: UITextField!
  @IBOutlet var waterRatioTF: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
    backgroundImage.image = UIImage(named: "background")
    self.view.insertSubview(backgroundImage, atIndex: 0)
    let myColor : UIColor = UIColor( red: 255, green: 255, blue:255, alpha: 1.0 )
    coffeeTF.layer.borderColor = myColor.CGColor
    coffeeRatioTF.layer.borderColor = myColor.CGColor
    waterRatioTF.layer.borderColor = myColor.CGColor
    coffeeTF.layer.borderWidth = 1
    coffeeRatioTF.layer.borderWidth = 1
    waterRatioTF.layer.borderWidth = 1
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

