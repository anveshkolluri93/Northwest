//
//  KinveyOperations.swift
//  ClockSpot
//
//  Created by  on 3/14/16.
//  Copyright © 2016.All rights reserved.
//

import Foundation

protocol OperationProtocol {
    func onSuccess()
    func onError(message:String)
    func noActiveUser()
    func loginFailed()
}

class KinveyOperations {

    let store:KCSAppdataStore!
    
    let operaionDelegate:OperationProtocol!
    
    init(operationProtocol:OperationProtocol){
        self.operaionDelegate = operationProtocol
        
        store = KCSAppdataStore.storeWithOptions([
            KCSStoreKeyCollectionName : "users",
            KCSStoreKeyCollectionTemplateClass : User.self
            ])
        
        
    }
    
    func saveData() {
        if let _ = KCSUser.activeUser() {
            
        }else{
            operaionDelegate.noActiveUser()
        }
    }
    
    func registerUser(user:User){
        
       
        
        let userRows  = [
           
            KCSUserAttributeGivenname : user.firstName,
            KCSUserAttributeSurname : user.lastName,
           // KCSUserAttributeEmail : user.userName,
            
        ]
        
        KCSUser.userWithUsername(
            user.email,
            password:user.password,
            fieldsAndValues: userRows as [NSObject : AnyObject],
            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    self.operaionDelegate.onSuccess()
                } else {
                    self.operaionDelegate.onError(errorOrNil.description)
                }
            }
        )
        
        saveData()
        print(user.password)
        store.saveObject(
            user,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    //save failed
                    print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                    self.operaionDelegate.onError("something gone wrong!")
                } else {
                    //save was successful
                    print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                    self.operaionDelegate.onSuccess()
                }
            },
            withProgressBlock: nil
        )
        
    }
    
    func loginUser(userLogin:Login) {
       
        KCSUser.loginWithUsername(
            userLogin.userName,
            password: userLogin.password,
            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    self.operaionDelegate.onSuccess()
                    //let message = "login successful"
//                    let alert = UIAlertView(
//                                            title: NSLocalizedString("Success!", comment: "Login Successful"),
//                                            message: message,
//                                            delegate: nil,
//                                            cancelButtonTitle: NSLocalizedString("OK", comment: "OK")
//                                        )
//                    alert.show()
                    
                    self.operaionDelegate.onSuccess()
                    
                } else {
                    //there was an error with the update save
//                    let message = errorOrNil.localizedDescription
//                    let alert = UIAlertView(
//                        title: NSLocalizedString("Create account failed", comment: "Sign account failed"),
//                        message: message,
//                        delegate: nil,
//                        cancelButtonTitle: NSLocalizedString("OK", comment: "OK")
//                    )
//                    alert.show()
                  self.operaionDelegate.onError("OOPS!")
                   
                }
            }//closure ending
        )
        
        
        
        
        
        
    }

    


}