//
//  FavortiesView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavortiesView: UIView {

    lazy var favoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        
        let CV = UICollectionView.init(frame: bounds, collectionViewLayout: layout)
        CV.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
        
        return CV
    }()
    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: UIScreen.main.bounds)
        addSubview(favoritesCollectionView)
       
        setupFavortiesCollectionViewConstraints()

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupFavortiesCollectionViewConstraints() {
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        favoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}

