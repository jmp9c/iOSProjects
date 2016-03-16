//
//  ViewController.swift
//  GPA-Calculator
//
//  Created by John Peden on 3/16/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* Declare the Text Fields */
    // Accidentally named them TV instead of TF
    // Grade
    @IBOutlet weak var GradeTV1: UITextField!
    @IBOutlet weak var GradeTV2: UITextField!
    @IBOutlet weak var GradeTV3: UITextField!
    @IBOutlet weak var GradeTV4: UITextField!
    @IBOutlet weak var GradeTV5: UITextField!
    @IBOutlet weak var GradeTV6: UITextField!
    @IBOutlet weak var GradeTV7: UITextField!
    @IBOutlet weak var GradeTV8: UITextField!
    @IBOutlet weak var GradeTV9: UITextField!
    
    // Credit Hours
    @IBOutlet weak var CreditHoursTF1: UITextField!
    @IBOutlet weak var CreditHoursTF2: UITextField!
    @IBOutlet weak var CreditHoursTF3: UITextField!
    @IBOutlet weak var CreditHoursTF4: UITextField!
    @IBOutlet weak var CreditHoursTF5: UITextField!
    @IBOutlet weak var CreditHoursTF6: UITextField!
    @IBOutlet weak var CreditHoursTF7: UITextField!
    @IBOutlet weak var CreditHoursTF8: UITextField!
    @IBOutlet weak var CreditHoursTF9: UITextField!
   /* End Declaration of Text Fields */

    /*Declare Arrays and Dictionaries */
    // Arrays
    var grades = [Double]()
    var creditHours = [Int]()
    
    // Dictionary
    var gpaDictionary = [
        
            "A"  : 4.0,
            "A-" : 3.67,
            "B+" : 3.33,
            "B"  : 3.0,
            "B-" : 2.67,
            "C+" : 2.33,
            "C"  : 2.0,
            "C-" : 1.67,
            "D+" : 1.33,
            "D"  : 1.0,
            "F"  : 0.0
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startCalculation(sender: UIButton) {
        storeGrades()
        //storeCreditHours()
        //calculateGPA()
    }
    
    func calculateGPA() {
        // multiplyAndSumArrays()
        // sumCreditHours()
        // divideSumsOfArrays()
    }
   
    /* Begin Function Definitions */
    func storeGrades() {
        
        grades.append(gpaDictionary[GradeTV1.text!]!)
        grades.append(gpaDictionary[GradeTV2.text!]!)
        grades.append(gpaDictionary[GradeTV3.text!]!)
        grades.append(gpaDictionary[GradeTV4.text!]!)
        grades.append(gpaDictionary[GradeTV5.text!]!)
        grades.append(gpaDictionary[GradeTV6.text!]!)
        grades.append(gpaDictionary[GradeTV7.text!]!)
        grades.append(gpaDictionary[GradeTV8.text!]!)
        grades.append(gpaDictionary[GradeTV9.text!]!)
        
       // Print out array to Console for debugging
        for x in grades {
            print("\(x)")
            
        }
    }


}

