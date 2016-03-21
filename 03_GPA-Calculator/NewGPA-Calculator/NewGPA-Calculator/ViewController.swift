//
//  ViewController.swift
//  NewGPA-Calculator
//
//  Created by John Peden on 3/20/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    
    
    var gpa = GPA(withArrayOfGrades: ["A", "B+", "A-", "C-"], withArrayOfCreditHours: [4, 3, 4])
    var gpa2 = GPA()
    func testGPA() {
        let g = gpa.calculateGPA()
        let g2 = gpa2.calculateGPAWith(arrayOfGrades: ["A", "A"], andArrayOfCreditHours: [4, 4])
        
        print("\(g)")
        print("\(g2)")
    }
    
    @IBAction func calculate() {
       testGPA()
    }
    
    
    
    
    
    
}

