//
//  HomeViewController.swift
//  firebasetest
//
//  Created by John Peden on 11/4/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController {
  
  var ref: FIRDatabaseReference!
  
  @IBOutlet var usernameTF: UITextField!
  @IBOutlet var userOutTF: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.hidesBackButton = true
    ref = FIRDatabase.database().reference()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func submit() {
    if let user = FIRAuth.auth()?.currentUser{
      if let username = usernameTF.text {
        ref.child("users").child(user.uid).setValue(["username": username])
      }
    }
    
    getUsername()
  }
  
  func getUsername() {
    let userID = FIRAuth.auth()?.currentUser?.uid
    ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
      // Get user value
      let value = snapshot.value as? NSDictionary
      let username = value?["username"] as! String
      
      self.userOutTF.text = username
      
      // ...
    }) { (error) in
      print(error.localizedDescription)
    }
  }
}
