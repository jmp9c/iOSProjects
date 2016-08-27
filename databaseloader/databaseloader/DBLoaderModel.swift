//
//  DBLoaderModel.swift
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import Foundation

class DBLoaderModel {
  
  var kisses: Int
  var hugs: Int
  var listens: Int
  var dinners: Int
  
  
  init() {
    kisses = 0
    hugs = 0
    listens = 0
    dinners = 0
  }
  
  init(k: Int, h: Int, l: Int, d: Int) {
    kisses = k
    hugs = h
    listens = l
    dinners = d
  }
  
}
