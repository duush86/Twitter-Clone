//
//  UserCell.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/20/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import Foundation
import LBTAComponents

class UserCell: DatasourceCell {
    
    
    
    override var datasourceItem: Any? {
        
        didSet {
            
            guard let user = datasourceItem as? User else {
                
                print("Unable to get user information")
                
                return
                
            }
            
            nameLabel.text = user.name
            
            userNameLabel.text = user.username
            
            bioTextView.text = user.bioText
            
            fetchImage(forUser: user)
            
            
        }
        
    }
    
    func fetchImage(forUser user: User){
        
        print("Fetching image")
        
        if let profileURL = user.profileImageURL {
            
            profileImageView.cacheThumbnail(forThumbnailURL: profileURL)
            
        }
        
    }
    
    let nameLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Antonio Orozco"
        
        label.font = UIFont.boldSystemFont(ofSize: 16)
            
        return label
    
    }()
    
    let userNameLabel: UILabel = {
       
        let label = UILabel()
                
        label.text = "@duush"
        
        label.font = UIFont.systemFont(ofSize: 14.0)
        
        label.textColor = UIColor(r: 130, g: 130, b: 130)
            
        return label
    
    }()
    
    let profileImageView: CustomImageView = {
        
        let imageView = CustomImageView()
        
        imageView.image = UIImage(named: "profile")
        
        imageView.layer.cornerRadius = 5
        
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    let bioTextView: UITextView = {
       
        let btx = UITextView()
                
        btx.text = "iPhone, iPad, iOS programming - Join us to learn more!"
        
        btx.font = UIFont.systemFont(ofSize: 15)
        
        btx.backgroundColor = .clear
        
        btx.isEditable = false
        
        return btx
        
    }()
    
    let followButton: UIButton = {
        
        let fb = UIButton()
        
        let twitterBlue = UIColor(r: 61, g: 167, b: 244)
        
        fb.layer.cornerRadius = 5
        
        fb.layer.borderColor = twitterBlue.cgColor
        
        fb.layer.borderWidth = 1
        
        fb.setTitle("Follow", for: .normal)
        
        fb.setTitleColor(twitterBlue, for: .normal)
        
        fb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return fb
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        separatorLineView.isHidden = false
           
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        
        addSubview(nameLabel)
        
        addSubview(userNameLabel)
        
        addSubview(bioTextView)
        
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -10, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 60, heightConstant: 30)
        
    
    }
    
}
