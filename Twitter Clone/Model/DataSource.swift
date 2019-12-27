//
//  DataSource.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/18/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSource: Datasource, JSONDecodable {
    
    let tron = TRON(baseURL: "http://localhost")
        
        var users: [User]
        
        required init(json: JSON) throws {
            
            var users = [User]()
            
            print("Now ready to parse JSON\n", json)
            
            let array = json["users"].array
            
            for userJSON in array! {
                
                let name = userJSON["name"].stringValue
                
                let userName = userJSON["username"].stringValue
                
                let bio = userJSON["bio"].stringValue
                
                let imageURL = userJSON["profileImageURL"].stringValue
                
                let user: User = User(name: name, username: userName, bioText: bio, profileImage: UIImage(named: "placeholder")!, profileImageURL: imageURL as NSString)
                
                users.append(user)
                
            }
                        
            self.users = users
        }
    
    
    let tweets: [Tweet] = {
     
//        let duushUser = User(name: "Antonio Orozco", username: "@duush", bioText: "hey this is duush, what's up!?", profileImage: (UIImage(named: "profile")!))
//
//        let tweet = Tweet(user: duushUser, message: "Hello, this is is duush and this is a tweet for testing and it needs to be long, kind of long.")
//
//        let tweet2 = Tweet(user: duushUser, message: "Hello, this is is duush and this is a tweet for testing and it needs to be long, kind of long. This is the seccond tweet for testing. Heello!")
//
//        return [tweet, tweet2]
        
        return []
    }()
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            
            return tweets.count
            
        }
        
        return users.count
    
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        
        return [UserHeader.self]
        
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        
        return [UserFooter.self]
        
    }
    
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        
        return [UserCell.self, TweetCell.self]
    
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            
            return tweets[indexPath.row]
        
        }
        
        return users[indexPath.row]
        
    }
    
}
