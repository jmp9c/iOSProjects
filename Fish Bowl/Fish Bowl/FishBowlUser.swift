//
//  FishBowlUser.swift
//  Fish Bowl
//
//  Created by John Peden on 8/27/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import Foundation

class FishBowlUser {
  
  var username: String!
  var phrases: [String]!
  var password: String!
  
  init(username u: String, phrases p: [String], password pw: String) {
    username = u
    phrases = p
    password = pw 
  }
}
