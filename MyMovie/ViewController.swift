//
//  ViewController.swift
//  MyMovie
//
//  Created by Kolluri,Anveshkumar on 3/18/16.
//  Copyright © 2016 Kolluri,Anveshkumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    

    @IBAction func logoutTappedSender(sender: AnyObject) {
         self.performSegueWithIdentifier("loginView", sender: self)
    }

}

