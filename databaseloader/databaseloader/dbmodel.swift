//
//  dbmodel.swift
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import Foundation

class dbmodel: NSObject {
  
  //var data = NSMutableData()
  let urlPath = "http://wwww.johnmahlonpeden.com/service.php"
  
//  func downloadItems() {
//    
//    let url: NSURL = NSURL(string: urlPath)!
//    var session: NSURLSession!
//    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//    
//    
//    session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//
//    let task = session.dataTaskWithURL(url)
//    
//    task.resume()
//    
//  }
  
  func downloadItems() {
    let url = URL(string: urlPath)
    let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
      print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
    }
    task.resume()
  }
  
  
  
  
  
  
  
  
}
