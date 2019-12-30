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
                
        var users: [User]
    
        var tweets: [Tweet]
        
        required init(json: JSON) throws {
                                                
            
            guard let usersJsonArray = json["users"].array, let tweetsJSONArray = json["tweets"].array else {
                
                throw NSError(domain: "duush-antonio.com", code: 1, userInfo: [NSLocalizedDescriptionKey: "Users or tweets not valid in JSON"])
                
            }
            
            self.users = usersJsonArray.map({return User(json: $0)})
            
            self.tweets = tweetsJSONArray.map({return Tweet(json: $0)})
        }
    
    
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
