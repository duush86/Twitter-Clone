//
//  HomeDataSourceController.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/17/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDataSourceController:  DatasourceController {
    
    let errorMessageLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Sorry, something went wrong"
        
        label.textAlignment = .center
        
        label.numberOfLines = 0
        
        label.isHidden = true
        
        return label
    }()
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionViewLayout.invalidateLayout()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        
        errorMessageLabel.fillSuperview()
        
        setupNavigationBarItems()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
                
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            
            if let err = err {
                
                self.errorMessageLabel.isHidden = false
                                
                if let apiError = err as? APIError<Service.JSONError> {
                    
                    if apiError.response?.statusCode != 200 {
                        
                        self.errorMessageLabel.text = "Status code was not 200"
                        
                    }
                }
                
                return
                
            }
            
            self.datasource = homeDataSource
            
        }
        
    }
    
    
    private func setupNavigationBarItems(){
        
        setupTitleNavBar()
        
        setupLeftNavItems()
        
        setupRightNavItems()
        
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            guard let user = self.datasource?.item(indexPath) as? User else {
                
                return .zero
                
            }
                
                let estimatedHight = estimatedHightForText(user.bioText)
                           
                return CGSize(width: view.frame.width, height: estimatedHight + 74)
                
            
        } else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else {
                return .zero
            }
            
            
            let estimatedHight = estimatedHightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHight + 74)
            
        }
        
        
        return CGSize(width: view.frame.width , height: 200)
        
    }
    
    private func estimatedHightForText(_ text: String) -> CGFloat {
        
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimateFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimateFrame.height
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            
            
            return .zero
            
        }
        
        return CGSize(width: view.frame.width, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            
            return .zero
    
        }
        
        return CGSize(width: view.frame.width, height: 64)
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
        
    }
    
    
    
}
