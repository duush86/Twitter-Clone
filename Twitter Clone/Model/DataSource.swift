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
                              User(name: "Pájaro Político", username: "@pajaropolitico", bioText: "Periodismo libre con todo el rigor. El sitio de noticias de México es Animal Político. #YoSoyAnimal", profileImage: UIImage(named: "profile_pajaro")!)]
        
        return maUser
    
    }()
    
    //let words = ["User1", "User2", "User3"]
    
    override func numberOfItems(_ section: Int) -> Int {
        
        return users.count
    
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        
        return [UserHeader.self]
        
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        
        return [UserFooter.self]
        
    }
    
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        
        return [UserCell.self]
    
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
                
        return users[indexPath.row]
        
    }
    
}
