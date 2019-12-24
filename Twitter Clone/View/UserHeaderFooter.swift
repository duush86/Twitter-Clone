//
//  Cells.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/18/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "WHO TO FOLLOW"
        
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        separatorLineView.isHidden = false
        
        backgroundColor = .white
        
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(textLabel)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "SHOW ME MORE"
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        label.textColor = UIColor(r: 61, g: 167, b: 244)
        
        return label
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        //backgroundColor = .white
        
        let whiteBackgroundView = UIView()
        
        whiteBackgroundView.backgroundColor = .white
        
        addSubview(whiteBackgroundView)

        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}
