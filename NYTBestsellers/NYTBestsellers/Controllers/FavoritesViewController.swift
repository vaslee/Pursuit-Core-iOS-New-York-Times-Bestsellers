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
        favortiesView.favoritesCollectionView.dataSource = self
        favortiesView.favoritesCollectionView.delegate = self
        self.favortiesView.favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavoritesCell")
    }
    


}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCell else {
            return UICollectionViewCell() }
        
        return cell
    }
}
