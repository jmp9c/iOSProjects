//
//  ViewController.swift
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let requestURL = URL(string: "http://www.johnmahlonpeden.com/service.php")
    let urlRequest = URLRequest(url: requestURL!)
    let session = URLSession.shared
    
    let task = session.dataTask(with: urlRequest) {
      (data, response, error) -> Void in
      let httpResponse = response as! HTTPURLResponse
      let statusCode = httpResponse.statusCode
      
      if (statusCode == 200) {
        print("Everyone is fine, file downloaded successfully.")
        
        do{
          
          let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments)
          
          if let item = json[0] as? [String: AnyObject] {
            
          }
          
          
        }catch {
          print("Error with Json: \(error)")
        }
      }
    }
    
    task.resume()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

