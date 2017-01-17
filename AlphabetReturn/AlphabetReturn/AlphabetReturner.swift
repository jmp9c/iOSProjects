//
//  AlphabetReturner.swift
//  AlphabetReturn
//
//  Created by John Peden on 1/17/17.
//  Copyright © 2017 jmp9c. All rights reserved.
//

import Foundation

class AlphabetReturner {
  
  // String of uppercase alphabet
  let uppercaseAlphabetAsString: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
  // String of lowercase alphabet
  var lowercaseAlphabetAsString: String {
    return uppercaseAlphabetAsString.lowercased()
  }
  
  // Array of alphabet in all caps
  var uppercaseAlphabetAsArrayOfStrings: [String] {
    var _arr_ = [String]()
    
    for index in uppercaseAlphabetAsString.characters.indices {
      _arr_.append(String(uppercaseAlphabetAsString[index]))
    }
    return _arr_
  }
  
  // Array of alphabet in lowercase
  var lowercaseAlphabetAsArrayOfStrings: [String] {
    return uppercaseAlphabetAsArrayOfStrings.map {
      $0.lowercased()
    }
  }
  
  // Dictionary of alphabet ["A": "a"]
  // Also, dictionaries are not ordered..don't forget that
  var uppercaseToLowerCaseAlphabetAsDictionary: [String: String] {
    var _dic_ = [String: String]()
    for i in 0..<25 {
      _dic_.updateValue(lowercaseAlphabetAsArrayOfStrings[i], forKey: uppercaseAlphabetAsArrayOfStrings[i])
    }
    return _dic_
  }
  
  // Dictionary of alphabet ["a": "A"]
  // Still unordered
  var lowercaseToUpperCaseAlphabetAsDictionary: [String: String] {
    var _dic_ = [String: String]()
    for i in 0..<25 {
      _dic_.updateValue(uppercaseAlphabetAsArrayOfStrings[i], forKey: lowercaseAlphabetAsArrayOfStrings[i])
    }
    return _dic_
  }
  
  init() {
    // do nothing at all.
  }
  
  
  
  
}

