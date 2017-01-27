//
//  Deck.swift
//  Magic Card Trick
//
//  Created by John Peden on 1/26/17.
//  Copyright © 2017 jmp9c. All rights reserved.
//

import UIKit

class Deck: NSObject {
  
  let suits = ["spade": "♠️", "heart": "❤️", "club": "♣️", "diamond": "♦️"]
  let faces = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  var deck = [String]()
  
  override init() {
    for suit in suits {
      for face in faces {
        deck.append("\(face)\(suit.1)")
      }
    }
  }
  
  func printDeck() {
    print(deck)
  }
  
  func shuffle() {
    // Fisher-Yates Shuffle
    for i in 0..<51 {
      let upper = 52
      let lower = i
      let j = Int(arc4random_uniform(UInt32(upper - lower))) + lower
      let temp = deck[j]
      deck[j] = deck[i]
      deck[i] = temp
    }
  }
  
  func deal() -> String {
    if !deck.isEmpty {
      return deck.popLast()!
    } else {
      return "Deck is empty"
    }
  }
}
