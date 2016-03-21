//
//  GPA-Model.swift
//  NewGPA-Calculator
//
//  Created by John Peden on 3/20/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import Foundation

class GPA {
    
    /* How a GPA Works:
    You find the GWA (Grade Weighted Average):
    So:
    
    Grade       Credits
    A            4    = (4.0 * 4) = 16.0
    B            4    = (3.0 * 4) = 12.0
    C            3    = (2.0 * 3) =  6.0
    _______________________________________
    GWA = 34.0
    
    You then divide the GWA by total number of credits.
    
    34.0 / 12 = 2.833333 (repeating) And that's your GPA.
    */
    
    /* Variables */
    private var gpa: Double = 0.0
    private var gwa: Double = 0.0
    
    /* Useful Values */
    private var sumOfCreditHours: Int = 0
    
    /* Two Arrays; one to store grades, the other credit hours */
    private var grades = [String]()
    private var creditHours = [Int]() 
    
    /* A Dictionary representing the grade to decimal value */
    private let gradesDoubleDictionary = [
        "A+" : 4.0,
        "A"  : 4.0,
        "A-" : 3.7,
        "B+" : 3.3,
        "B"  : 3.0,
        "B-" : 2.7,
        "C+" : 2.3,
        "C"  : 2.0,
        "C-" : 1.7,
        "D+" : 1.3,
        "D"  : 1.0,
        "D-" : 0.7,
        "F"  : 0.0
    ]
    
    init() {
        gpa = 0.0
        gwa = 0.0
        sumOfCreditHours = 0
        grades = []
        creditHours = []
    }
    init(withArrayOfGrades grades: [String], withArrayOfCreditHours creditHours: [Int]){
        self.grades = grades
        self.creditHours = creditHours
        self.sumOfCreditHours = creditHours.reduce(0, combine: +)
        self.gpa = 0.0
        self.gwa = 0.0
    }
    
    /* Methods */
    /* Calculates the gwa, then finds the gpa and returns gpa as Double */
    func calculateGPA() -> Double {
        gwa = calculateGWA(self.grades, creditHours: self.creditHours)
        let g = gwa / Double(self.sumOfCreditHours)
        return g
    }
    
    /* Calculates the GPA for a blank GPA */
    func calculateGPAWith(arrayOfGrades grades: [String], andArrayOfCreditHours creditHours: [Int]) -> Double {
        gwa = calculateGWA(grades, creditHours: creditHours)
        gpa = gwa / Double(sumOfCreditHours)
        return gpa
    }
    
    /* This method can be dangerous... */
    private func calculateGWA(grades: [String], creditHours: [Int]) -> Double {
        if grades.count == creditHours.count {
            for var i = 0; i < grades.count; i++ {
                let gradeValue = gradesDoubleDictionary[grades[i]]
                gwa = gwa + (gradeValue! * Double(creditHours[i]))
            }
           return gwa
        } else {
            print("Error in calculateGWA")
            return 999.9999999      // This is for error referencing
        }
    }
}
