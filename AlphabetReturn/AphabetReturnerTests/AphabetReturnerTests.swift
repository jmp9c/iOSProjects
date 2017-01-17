//
//  AphabetReturnerTests.swift
//  AphabetReturnerTests
//
//  Created by John Peden on 1/17/17.
//  Copyright © 2017 jmp9c. All rights reserved.
//

import XCTest
@testable import AlphabetReturn

class AphabetReturnerTests: XCTestCase {
  let cs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let ar = AlphabetReturner()
  
  override func setUp() {
    super.setUp()
    
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  // test capital string
  
  func testCapitalString() {
    XCTAssertEqual(ar.uppercaseAlphabetAsString, cs)
  }
  
  
  
  
  
  
}
