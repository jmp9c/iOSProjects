//
//  ContactViewController.swift
//  Contacts
//
//  Created by John Peden on 3/26/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    var name: String =  ""
    var number: String = ""
    var email: String = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        numberLabel.text = number
        emailLabel.text = email 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
