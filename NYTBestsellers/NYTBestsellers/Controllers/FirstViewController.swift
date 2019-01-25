//
//  FirstViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let firstView = FirstView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstView)
        
        self.firstView.firstCollectionView.register(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        
    }
    

  
}
