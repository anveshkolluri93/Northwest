//
//  User.swift
//  ClockSpot
//
//  Created by  on 3/13/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation



class User :NSObject {
    
   // var activities:Activities = Activities()
    var firstName:String!
    var lastName:String!
    var password:String!
    var confirmPassword:String!
    var email:String!
    
    init(firstName:String, lastName:String, email:String, password:String, confirmPassword:String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        
        
    }
    
    
    
    init(email:String)
    {
       self.email = email
    }
    
   
    init(password:String)
    {
        self.password = password
    }
    
    init(confirmPassword:String)
    {
        self.confirmPassword = confirmPassword
    }
    
    
    
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "firstName" : "firstName",
            "lastName" : "lastName",
            "email" : "email",
            "password" : "password",
            
        ]
    }
    
    
    
    func display(user:User) {
    
      print("\(user.firstName) \(user.lastName) \(user.email) ")
    
    }
    
}