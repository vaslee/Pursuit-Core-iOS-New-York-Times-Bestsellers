//
//  FirstViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

//    var googleBooks = [BooksInfo]() {
//        didSet {
//            DispatchQueue.main.async {
//                self.firstView.firstCollectionView.reloadData()
//            }
//        }
//    }
    var nytBooks = [BooksInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.firstView.firstCollectionView.reloadData()
            }
        }
    }
    var categorties = [CategoriesWarpper](){
        didSet{
            DispatchQueue.main.async {
                self.firstView.firstPickerView.reloadAllComponents()
            }
        }
    }
    let firstView = FirstView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        firstView.firstPickerView.dataSource = self
        firstView.firstPickerView.delegate = self
        firstView.firstCollectionView.dataSource = self
        firstView.firstCollectionView.delegate = self
        view.backgroundColor = .white
        view.addSubview(firstView)
        
        CategoriesAPIClient.searchCategories { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let categorties = data {
                self.categorties = categorties
                
            }
        }
        self.firstView.firstCollectionView.register(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let book = nytBooks[indexPath.row]
        
        
        let detailVC = DetailViewController()
        detailVC.detailView.detailAuthorsName.text = book.book_details[0].author
        
//        let books = googleBooks[indexPath.row]
        
        detailVC.detailView.detailDescriptionOfBook.text = book.book_details[0].description
//        
//        detailVC.detailView.detailBookImage = UIImageView(image: UIImage(named: book.book_details[0].primary_isbn13))
//        
        
        // or use dependency injection
        // let detailVC = DetailViewController(book: book)
        
        // assuming you have embedded in a navigation controller
        navigationController!.pushViewController(detailVC, animated: true)
        
    }

  
}
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nytBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as? FirstCell else {
            return UICollectionViewCell() }
        let nytBook = nytBooks[indexPath.row]
        cell.weeksOnListLabel.text = nytBooks[indexPath.row].weeks_on_list.description + "weeks on best seller list"
        cell.firstDescriptionTextView.text = nytBooks[indexPath.row].book_details[0].description
        GoogleAPIClient.searchGoogle(isbn: nytBook.book_details[0].primary_isbn13) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: (data.imageLinks.smallThumbnail) ) { (appError, image) in
                if let appError = appError {
                    print(appError.errorMessage())
                    
                }else if let image = image {
                    cell.bestBookImage.image = image
                }
            }
            }
        }
        
        return cell
    }
}

extension FirstViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorties.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorties[row].list_name
    }
    
}

extension FirstViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NYTAPIClient.searchBooks(category: categorties[row].list_name) { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let nytbooks = data {
                self.nytBooks = nytbooks
                dump(self.nytBooks)
                
            }
        }
    }
}
