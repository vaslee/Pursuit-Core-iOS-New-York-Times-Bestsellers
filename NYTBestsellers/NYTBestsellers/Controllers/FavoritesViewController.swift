//
//  SecondViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favortiesView = FavortiesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(favortiesView)
        
        self.favortiesView.favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavoritesCell")
    }
    


}
