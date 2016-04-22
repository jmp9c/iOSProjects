//
//  ViewController.swift
//  Level
//
//  Created by John Peden on 4/22/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var x_label: UILabel!
  @IBOutlet var y_label: UILabel!
  @IBOutlet var z_label: UILabel!
  let motionKit = MotionKit()
  
  @IBOutlet var imgv: UIImageView!
  @IBAction func go() {
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    motionKit.getDeviceMotionObject(0.01){
      (deviceMotion) -> () in
      
      let gravity = deviceMotion.gravity
      let rotation = atan2(gravity.x, gravity.y) - M_PI
      
      self.imgv.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
    
    

  }


}

