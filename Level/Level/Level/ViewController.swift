//
//  ViewController.swift
//  Level
//
//  Created by John Peden on 4/22/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var X: UILabel!

  @IBOutlet var Y: UILabel!

  @IBOutlet var Z: UILabel!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    update(); 
      //var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    
    }
    func update(){
      print("hi")
      let motionKit = MotionKit()
      motionKit.getGyroValues(1.0){
        (x, y, z) in
        //Do whatever you want with the x, y and z values
        print("\(x)")
        self.X.text = String(Int(x))
        self.Y.text = String(y)
        self.Z.text = String(z)
    }
  
  
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

