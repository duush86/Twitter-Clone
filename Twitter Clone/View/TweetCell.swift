//
//  TweetCell.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/24/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        
        didSet {
            
            guard let tweet = datasourceItem  as? Tweet else { return }
            
            loadImage(forTweet: tweet)
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = " \(tweet.user.username)\n"
            
            let paragraphStyle = NSMutableParagraphStyle()
            
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributedText.string.count)
            
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
            
        }
        
    }
    
    func loadImage(forTweet tweet: Tweet)  {
        
        if let profileURL = tweet.user.profileImageURL {
            
            profileImageView.cacheThumbnail(forThumbnailURL: profileURL)
            
        }
        
    }
    
    let profileImageView: CustomImageView = {
        
        let imageView = CustomImageView()
        
        imageView.image = UIImage(named: "placeholder")
        
        imageView.layer.cornerRadius = 5
        
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    let messageTextView: UITextView = {
        
        let tv = UITextView()
        
        tv.isEditable = false
        
        tv.text = "HELLO THIS IS A TEST TWEET HELLO THIS IS A TEST TWEET HELLO THIS IS A TEST TWEET HELLO THIS IS A TEST TWEET HELLO THIS IS A TEST TWEET HELLO THIS IS A TEST TWEET"
                
        tv.backgroundColor = .clear
        return tv
    }()
    
    let replyButton: UIButton = {
       
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let rtButton: UIButton = {
       
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let favButton: UIButton = {
       
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let dmButton: UIButton = {
          
           let button = UIButton(type: .system)
           
           button.setImage(UIImage(named: "dm")?.withRenderingMode(.alwaysOriginal), for: .normal)
           
           return button
       }()
    
    
    override func setupViews() {
        
        separatorLineView.isHidden = false
        
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        
        addSubview(messageTextView)
        
        addSubview(replyButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                        
        setupBottomButtons()
        
    }
    
    fileprivate func setupBottomButtons(){
        
        let replyButtonContainerView = UIView()
                
        let rtButtonContainerView = UIView()
                
        let favButtonContainerView = UIView()
                
        let dmButtonContainerView = UIView()
                
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, rtButtonContainerView, favButtonContainerView, dmButtonContainerView])
        
        buttonStackView.axis = .horizontal
        
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(rtButton)
               
        rtButton.anchor(rtButtonContainerView.topAnchor, left: rtButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(favButton)
               
        favButton.anchor(favButtonContainerView.topAnchor, left: favButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(dmButton)
               
        dmButton.anchor(dmButtonContainerView.topAnchor, left: dmButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
    }
    
}
