//
//  User.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/19/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    
    let name: String
    
    let username: String
    
    let bioText: String
        
    let profileImageURL: NSString?
    
    init(json: JSON){
        
        self.name = json["name"].stringValue
        
        self.username = json["username"].stringValue

        self.bioText = json["bio"].stringValue
        
        self.profileImageURL = json["profileImageURL"].stringValue as NSString
    }
}
