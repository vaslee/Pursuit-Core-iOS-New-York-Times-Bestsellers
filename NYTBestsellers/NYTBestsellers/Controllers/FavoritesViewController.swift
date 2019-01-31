//
//  SecondViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    
    var saveBooks = BooksModel.getBooks()
//     var favortiesBook = String()
    var favortiesView = FavortiesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(favortiesView)
        favortiesView.favoritesCollectionView.dataSource = self
        favortiesView.favoritesCollectionView.delegate = self
        self.favortiesView.favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavoritesCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveBooks = BooksModel.getBooks().reversed()
        favortiesView.favoritesCollectionView.reloadData()
    }


}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCell else {
            return UICollectionViewCell() }
        
        let favorite = saveBooks[indexPath.row]
        if let image = UIImage(data: favorite.imageData) {
            cell.bookImage.image = image
        }
        if let authors = favorite.author {
            cell.authorsName.text = authors
        }
        
        if let description = favorite.description {
            cell.descriptionOfBook.text = description
        }
        cell.alertButton.tag = indexPath.row
        cell.alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        return cell
    }
    @objc func alertAction(_ sender: UIButton) {
       
        let alert = UIAlertController(title: "What do you need?", message: "Please Select an Option", preferredStyle: .actionSheet)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            BooksModel.delete(atIndex: sender.tag)
            self.saveBooks = BooksModel.getBooks()
            self.favortiesView.favoritesCollectionView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in })
        
        alert.addAction(deleteButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}
