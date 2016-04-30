//
//  ViewController.swift
//  TouchID
//
//  Created by John Peden on 4/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func BTNAction(sender: AnyObject) {
    TouchIDCall()
  }
  
  func TouchIDCall() {
    var context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
      var reason = "Identify yourself!"
      
      context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
        [unowned self] (success: Bool, authenticationError: NSError?) -> Void in
        
        dispatch_async(dispatch_get_main_queue()) {
          if success {
            NSLog("YES")
          } else {
            if let error = authenticationError {
              if error.code == LAError.UserFallback.rawValue {
                let ac = UIAlertController(title: "Passcode? Ha!", message: "It's Touch ID or nothing – sorry!", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(ac, animated: true, completion: nil)
                return
              }
            }
            
            let ac = UIAlertController(title: "Authentication failed", message: "Your fingerprint could not be verified; please try again.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(ac, animated: true, completion: nil)
          }
        }
      }
    } else {
      let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .Alert)
      ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      self.presentViewController(ac, animated: true, completion: nil)
    }
  }
}