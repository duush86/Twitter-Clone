//
//  Cells.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/18/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {
    
    override func setupViews() {
        
        super.setupViews()
               
        backgroundColor = .blue
        
    }
    
}

class UserHeader: DatasourceCell {
    
    override func setupViews() {
        
        super.setupViews()
        
        backgroundColor = .blue
        
    }
    
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        
        didSet {
            
            nameLabel.text = datasourceItem as? String
            
        }
        
    }
    
    let nameLabel: UILabel = {
       
        let label = UILabel()
            
        return label
    
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
    }
    
}
