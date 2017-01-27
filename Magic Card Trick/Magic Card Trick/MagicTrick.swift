//
//  MagicTrick.swift
//  Magic Card Trick
//
//  Created by John Peden on 1/26/17.
//  Copyright © 2017 jmp9c. All rights reserved.
//

import UIKit

class MagicTrick: NSObject {
  
  let deck = Deck()
  var stack1 = [String]()
  var stack2 = [String]()
  var stack3 = [String]()
  var allStacks = [String]()
  
  override init() {
    deck.shuffle()
    
    for _ in 0..<7 {
      stack1.append(deck.deal())
      stack2.append(deck.deal())
      stack3.append(deck.deal())
    }
    
  }
  
  func dealStacks() {
    stack1.removeAll()
    stack2.removeAll()
    stack3.removeAll()
    
    var i = 0
    for _ in 0..<7 {
      stack1.append(allStacks[i])
      stack2.append(allStacks[i+1])
      stack3.append(allStacks[i+2])
      i += 3
    }
  }
  
  func placeStacksTogether(chosenStack: Int) {
    
    allStacks.removeAll()
    
    if chosenStack == 1 {
      allStacks = stack2 + stack1 + stack3
    }
      
    else if chosenStack == 2 {
      allStacks = stack1 + stack2 + stack3
    }
      
    else if chosenStack == 3 {
      allStacks = stack1 + stack3 + stack2
    }
  }
  
  func endGame() -> String {
    
    let finalStack = stack1 + stack2 + stack3
    
    return finalStack[10]
    
  }
  
  
}



