//
//  LoginViewController.swift
//  MyMovie
//
//  Created by Kolluri,Anveshkumar on 3/18/16.
//  Copyright © 2016 Kolluri,Anveshkumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!

    
    @IBAction func logionTapped(sender: AnyObject) {
        //Authentication Part
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
