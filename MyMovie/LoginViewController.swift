//
//  LoginViewController.swift
//  MyMovie
//
//  Created by Kolluri,Anveshkumar on 3/18/16.
//  Copyright © 2016 Kolluri,Anveshkumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, OperationProtocol {
    var kinveyOperations:KinveyOperations!
    var login:Login!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true;
        self.navigationItem.setHidesBackButton(true, animated:true)
        kinveyOperations = KinveyOperations(operationProtocol: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!

    
    @IBAction func logionTapped(sender: AnyObject) {
        login = Login(userName: txtUsername.text!, password: txtPassword.text!)
        kinveyOperations.loginUser(login)

    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:  { action in self.performSegueWithIdentifier("success", sender: self) }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    
    func displayAlertControllerWithFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
    }
    
    
    func onError(message: String) {
        displayAlertControllerWithFailure("OOPS!", message:"Login Failed")
        
    }
    func onSuccess() {
        displayAlertControllerWithTitle("Success", message:"Login Successful")
    }
    func noActiveUser() {
        //
    }
    
    func loginFailed() {
        //
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
