//
//  SignUpViewController.swift
//  firebasetest
//
//  Created by John Peden on 11/4/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
  @IBOutlet var email: UITextField!
  @IBOutlet var password: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    password.isSecureTextEntry = true
    
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func signUp() {
    let emailText = email.text
    let passwordText = password.text
    FIRAuth.auth()?.createUser(withEmail: emailText!, password: passwordText!) { (user, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
    }
    
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
