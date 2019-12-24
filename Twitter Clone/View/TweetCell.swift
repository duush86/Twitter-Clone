//
//  TweetCell.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/24/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
           
           let imageView = UIImageView()
           
           imageView.image = UIImage(named: "profile")
           
           imageView.layer.cornerRadius = 5
           
           imageView.layer.masksToBounds = true
           
           return imageView
           
       }()
    
    override func setupViews() {
        
        separatorLineView.isHidden = false
        
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
    }
    
}
