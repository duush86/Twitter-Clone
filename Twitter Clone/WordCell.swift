//
//  WordCell.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/17/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    var wordLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "THIS IS TEST TEXT"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    func setupViews(){
        
        backgroundColor = .yellow
        
        addSubview(wordLabel)
        
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
