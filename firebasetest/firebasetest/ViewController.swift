//
//  ViewController.swift
//  firebasetest
//
//  Created by John Peden on 11/4/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

  @IBOutlet var email: UITextField!
  @IBOutlet var password: UITextField!
  @IBOutlet var firebaseImage: UIImageView!
  @IBOutlet var loginbutton: UIButton!
  @IBOutlet var signupbutton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    password.isSecureTextEntry = true
    firebaseImage.center.x -= view.bounds.width
    email.alpha = 0.0
    password.alpha = 0.0
    loginbutton.alpha = 0.0
    signupbutton.alpha = 0.0
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
      self.firebaseImage.center.x += self.view.bounds.width
    }, completion: nil)
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
      self.email.alpha = 1.0
      self.password.alpha = 1.0
      self.loginbutton.alpha = 1.0
      self.signupbutton.alpha = 1.0
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func login() {
    // guard
    if let emailText = email.text {
      if let passwordText = password.text {
        
        FIRAuth.auth()?.signIn(withEmail: emailText, password: passwordText) { (user, error) in
          if let error = error {
            // if there is an error, make an alert with error
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
          }
          
          self.signin(user)
        }
      }
    }
  }
  
  func signin(_ user: FIRUser?) {
    performSegue(withIdentifier: "logInSegue", sender: nil)
  }
  
  
  @IBAction func signUpClicked() {
    
    UIView.animate(withDuration: 0.5) {
      self.firebaseImage.center.x -= self.view.bounds.width
      
    }
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
      self.email.alpha = 0.0
      self.password.alpha = 0.0
      self.loginbutton.alpha = 0.0
      self.signupbutton.alpha = 0.0
    }, completion: nil)
    
    
  }
}

