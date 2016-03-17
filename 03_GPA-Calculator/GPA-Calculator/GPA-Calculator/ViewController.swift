//
//  ViewController.swift
//  GPA-Calculator
//
//  Created by John Peden on 3/16/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Final GPA Label to display GPA
    @IBOutlet weak var gpaLabel: UILabel!
    
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
    var arrayforGWA = [Double]()
    var arrayOfPossibleEntries = ["A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "F"]
    @IBOutlet var collectionOfGradeTF: Array<UITextField>?
    @IBOutlet var collectionOfCreditHoursTF: Array<UITextField>?
    

    // Dictionary
    var gpaDictionary = [
        
            "A+" : 4.0,
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
    
   /* Declare variables */
    var gwa: Double = 0.0
    var gpa: Double = 0.0
    var sumOfCredits: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addAllTextFields() {
        collectionOfGradeTF?.append(GradeTV1)
        collectionOfGradeTF?.append(GradeTV2)
        collectionOfGradeTF?.append(GradeTV3)
        collectionOfGradeTF?.append(GradeTV4)
        collectionOfGradeTF?.append(GradeTV5)
        collectionOfGradeTF?.append(GradeTV6)
        collectionOfGradeTF?.append(GradeTV7)
        collectionOfGradeTF?.append(GradeTV8)
        collectionOfGradeTF?.append(GradeTV9)
        
        collectionOfCreditHoursTF?.append(CreditHoursTF1)
        collectionOfCreditHoursTF?.append(CreditHoursTF2)
        collectionOfCreditHoursTF?.append(CreditHoursTF3)
        collectionOfCreditHoursTF?.append(CreditHoursTF4)
        collectionOfCreditHoursTF?.append(CreditHoursTF5)
        collectionOfCreditHoursTF?.append(CreditHoursTF6)
        collectionOfCreditHoursTF?.append(CreditHoursTF7)
        collectionOfCreditHoursTF?.append(CreditHoursTF8)
        collectionOfCreditHoursTF?.append(CreditHoursTF9)
    }
    
    func printTFText() {
        for i in 0..<(collectionOfGradeTF?.count)!{
            print("\(collectionOfGradeTF![i].text)")
        }
    }
    
    func clearAll() {
        gpa = 0.0
        gwa = 0.0
        sumOfCredits = 0
        grades.removeAll()
        creditHours.removeAll()
        arrayforGWA.removeAll()
    }

    @IBAction func startCalculation(sender: UIButton) {
        clearAll()
        
        
        storeGrades()
        storeCreditHours()
        calculateGPA()
        gpaLabel.text = String(gpa)
    }
    
    func checkUserInput(s: String){
        for i in 0..<arrayOfPossibleEntries.count {
            if s == arrayOfPossibleEntries[i]{
                return
            }
            
        }
        gpaLabel.text = "Sorry please enter a valid grade. Please delete all spaces"
    }
    
    func calculateGPA() {
         multiplyAndSumArrays()
         sumCreditHours()
         divideSumsOfArrays()
        
    }
   
    /* Begin Function Definitions */
    func storeGrades() {
        
       
        /* What's happening here is, because not all the textfields are being used,
            I have to check and see if the textfield.text != nil, which is being done with
            putGradesInArray. Unfortunately I couldn't make a loop because for somereason
            I couldn't get tags to work :/.

        */
        
        
        
        putGradesInArray(GradeTV1)
        putGradesInArray(GradeTV2)
        putGradesInArray(GradeTV3)
        putGradesInArray(GradeTV4)
        putGradesInArray(GradeTV5)
        putGradesInArray(GradeTV6)
        putGradesInArray(GradeTV7)
        putGradesInArray(GradeTV8)
        putGradesInArray(GradeTV9)
        
       // Print out array to Console for debugging
        for x in grades {
            print("\(x)")
            
        }
    }
    
    func putGradesInArray(tf: UITextField){
        if let s = tf.text{
            if let a = gpaDictionary[s]{
                grades.append(a)
            }
        }
    }
    
    func storeCreditHours(){
        
        putCreditHoursInArray(CreditHoursTF1)
        putCreditHoursInArray(CreditHoursTF2)
        putCreditHoursInArray(CreditHoursTF3)
        putCreditHoursInArray(CreditHoursTF4)
        putCreditHoursInArray(CreditHoursTF5)
        putCreditHoursInArray(CreditHoursTF6)
        putCreditHoursInArray(CreditHoursTF7)
        putCreditHoursInArray(CreditHoursTF8)
        putCreditHoursInArray(CreditHoursTF9)
        
        for x in creditHours {
            print("\(x)")
        }
    }
    
    func putCreditHoursInArray(tf: UITextField){
        if let s = tf.text{
            if let x: Int = Int(s) {
             creditHours.append(x)
            }
            
        }
    }
    
    func multiplyAndSumArrays(){
        var multiple: Double
        
        /* Multiply grade value * credit hours and store it in an array */
        if grades.count == creditHours.count {
            for x in 0..<creditHours.count {
                multiple = grades[x] * Double(creditHours[x])
                arrayforGWA.append(multiple)
            }
            
            /* This next function sums all the elements in the array using reduce.
                I don't know why or how, but....just trust me */
            
            gwa = arrayforGWA.reduce(0, combine: +)

        }
    }
    
    func sumCreditHours() { sumOfCredits = creditHours.reduce(0, combine: +) }
    
    func divideSumsOfArrays() { gpa  = gwa / Double(sumOfCredits) }
}

