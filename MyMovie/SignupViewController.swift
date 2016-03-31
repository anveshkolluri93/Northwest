//
//  SignupViewController.swift
//  MyMovie
//
//  Created by Kolluri,Anveshkumar on 3/18/16.
//  Copyright © 2016 Kolluri,Anveshkumar. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,OperationProtocol{
  var kinvey:KinveyOperations!
     var user:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        kinvey = KinveyOperations(operationProtocol: self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var txtEmail: UITextField!

    
    @IBOutlet weak var txtFirstName: UITextField!
    
    
    @IBOutlet weak var txtLastName: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var txtReenterPassword: UITextField!
    
    
    @IBAction func registerTapped(sender: AnyObject) {
        user = User(firstName: txtFirstName.text!, lastName: txtLastName.text!, email: txtEmail.text!, password: txtPassword.text!, confirmPassword: txtReenterPassword.text!)
        
       
        kinvey.registerUser(user)
        
        displayAlertControllerWithTitle("Success", message:"Registration Successful")
        

    }
    
    //@IBAction func gotoLogin(sender: AnyObject) {
    //    self.dismissViewControllerAnimated( true , completion: nil)
   // }
    
    
    func onSuccess() {
        //
    }
    
    func onError(message: String) {
        //
    }
    
    func noActiveUser() {
        //
    }
    
    func loginFailed() {
        //code
    }
    
    
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:  { action in self.performSegueWithIdentifier("registersuccess", sender: self) }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    func displayAlertControllerWithTitleforFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
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
