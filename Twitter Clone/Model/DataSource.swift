//
//  DataSource.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/18/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
      
        let maUser: [User] = [User(name: "Antonio Orozco", username: "@duush", bioText: "hey this is duush, what's up!?", profileImage: (UIImage(named: "profile")!)),
                              User(name: "Pájaro Político", username: "@pajaropolitico", bioText: "Periodismo libre con todo el rigor. El sitio de noticias de México es Animal Político. #YoSoyAnimal", profileImage: UIImage(named: "profile_pajaro")!),
                              User(name: "Kindle Course", username: "@kindleCourse", bioText: "Periodismo libre con todo el rigor. El sitio de noticias de México es Animal Político. #YoSoyAnimal Periodismo libre con todo el rigor. El sitio de noticias de México es Animal Político. #YoSoyAnimal Periodismo libre con todo el rigor. El sitio de noticias de México es Animal Político. #YoSoyAnimal", profileImage: UIImage(named: "profile_pajaro")!)]
        
        return maUser
    
    }()
    
    let tweets = ["t1", "t2", "t3"]
    
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
                
        return users[indexPath.row]
        
    }
    
}
