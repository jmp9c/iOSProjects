//
//  ViewController.swift
//  Fish Bowl
//
//  Created by John Peden on 8/27/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var dataFetcher: JMPDataFetcher!
  var vm: ViewModel!

  @IBOutlet var usernameTF: UITextField!
  @IBOutlet var passwordTF: UITextField!
  @IBOutlet var item1TF: UITextField!
  @IBOutlet var item2TF: UITextField!
  @IBOutlet var item3TF: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func submit() {
    
    let uname = usernameTF.text
    let pw = passwordTF.text
    let phrases = [item1TF.text!, item2TF.text!, item3TF.text!]
    
    let user = FishBowlUser(username: uname!, phrases: phrases, password: pw!)
    vm = ViewModel(user: user)
    
    vm.addUserToDatabase()
    
  }

}

