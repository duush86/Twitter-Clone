//
//  Tweet.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/24/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    
    let user: User
    
    let message: String
    
    init(json: JSON){

        let userJSON = json["user"]
        
        self.user = User(json: userJSON)
        
        self.message = json["message"].stringValue
        
    }
    
}
