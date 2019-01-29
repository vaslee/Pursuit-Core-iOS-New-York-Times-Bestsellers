//
//  FirstView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class FirstView: UIView {
 
    
    lazy var firstPickerView: UIPickerView = {
        let pv = UIPickerView()
      
        pv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return pv
    }()
    
    lazy var firstCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        
        let CV = UICollectionView.init(frame: bounds, collectionViewLayout: layout)
        CV.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
       
        
        return CV
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: UIScreen.main.bounds)
        addSubview(firstCollectionView)
        addSubview(firstPickerView)
        setupFirstPickerViewConstraints()
        setupFirstCollectionViewConstraints()
 
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    func setupFirstPickerViewConstraints() {
        firstPickerView.translatesAutoresizingMaskIntoConstraints = false
        firstPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        firstPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        firstPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        firstPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
    }
    func setupFirstCollectionViewConstraints() {
        firstCollectionView.translatesAutoresizingMaskIntoConstraints = false
        firstCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        firstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        firstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}

