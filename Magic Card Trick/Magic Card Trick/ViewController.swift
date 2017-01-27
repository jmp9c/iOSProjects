//
//  ViewController.swift
//  Magic Card Trick
//
//  Created by John Peden on 1/26/17.
//  Copyright © 2017 jmp9c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let game = MagicTrick()

  @IBOutlet var stack1: UILabel!
  @IBOutlet var stack2: UILabel!
  @IBOutlet var stack3: UILabel!
  @IBOutlet var stack1Lab: UILabel!
  @IBOutlet var stack2Lab: UILabel!
  @IBOutlet var stack3Lab: UILabel!
  @IBOutlet var final: UILabel!
  
  var count = 0
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    displayStacks()
 
  }

  func displayStacks() {
    stack1.text = game.stack1.joined(separator: " ")
    stack2.text = game.stack2.joined(separator: " ")
    stack3.text = game.stack3.joined(separator: " ")
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    
    count += 1
    
    let stack_no = Int((sender.titleLabel?.text)!)
    
    game.placeStacksTogether(chosenStack: stack_no!)
    
    if count < 4 {
      game.dealStacks()
      displayStacks()
    } else {
      let chosenCard = game.endGame()
      
      stack1.isHidden = true
      stack2.isHidden = true
      stack3.isHidden = true
      stack1Lab.isHidden = true
      stack2Lab.isHidden = true
      stack3Lab.isHidden = true
      
      final.text = chosenCard
    }
    
  }

}

