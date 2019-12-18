//
//  DataSource.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/18/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let words = ["User1", "User2", "User3"]
    
    override func numberOfItems(_ section: Int) -> Int {
        
        return words.count
    
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
                
        return words[indexPath.row]
        
    }
    
}
