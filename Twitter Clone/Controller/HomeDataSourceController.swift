//
//  HomeDataSourceController.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/17/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import LBTAComponents


class HomeDataSourceController: DatasourceController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        let homeDataSource = HomeDataSource()
        
        self.datasource = homeDataSource
        
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
        
        if let user = self.datasource?.item(indexPath) as? User {
        
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            
            let estimateFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimateFrame.height + 66)
            
        }
        
    
        return CGSize(width: view.frame.width , height: 200)
        
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
