//
//  ViewModel.swift
//  Fish Bowl
//
//  Created by John Peden on 9/1/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import Foundation

class ViewModel {
  
  var user: FishBowlUser!
  var dataManager: JMPDataFetcher!
  
  init(user u: FishBowlUser) {
    user = u
    dataManager = JMPDataFetcher(); 
  }
  
  func addUserToDatabase() {
    for phrase in user.phrases {
      dataManager.updateDatabase(withPhrase: phrase, withUser: user.username, withPassword: user.password, withAction: "INSERT")
    }
  }
  
  func remove(user u: FishBowlUser) {
    for phrase in user.phrases {
      dataManager.updateDatabase(withPhrase: phrase, withUser: u.username, withPassword: u.password, withAction: "DELETE")
    }
  }
  
  func remove(phrase p: String, forUser u: FishBowlUser) {
    dataManager.updateDatabase(withPhrase: p, withUser: u.username, withPassword: u.password, withAction: "DELETE")
  }
  
  
  
  
  
  
  
  
  
  
}
