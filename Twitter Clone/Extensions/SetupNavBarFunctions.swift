//
//  SetupNavBarFunctions.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/23/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
  
    func setupTitleNavBar() {
        
        let titleImageView = UIImageView(image: UIImage(named: "twitter"))
               
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
               
        titleImageView.contentMode = .scaleAspectFit
               
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(navBarSeparatorView)
        
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
    }

     func setupLeftNavItems() {
        
        let followButton = UIButton(type: .system)
               
        let buttonImage = UIImage(named: "follow")
               
        followButton.setImage(buttonImage?.withRenderingMode(.alwaysOriginal), for: .normal)
               
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
               
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
    }

     func setupRightNavItems(){
        
        let searchButton = UIButton(type: .system)
               
        let searchImage = UIImage(named: "search")
               
        searchButton.setImage(searchImage?.withRenderingMode(.alwaysOriginal), for: .normal)
               
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
               
        let composeImage = UIImage(named: "compose")
               
        composeButton.setImage(composeImage?.withRenderingMode(.alwaysOriginal), for: .normal)
               
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
               
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)]
        
    }
}
