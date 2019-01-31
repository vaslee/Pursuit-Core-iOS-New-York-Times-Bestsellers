//
//  FirstViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    var bookDescription = String()
    var selectedIsbn = String()
    
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
        defaultSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        defaultSetting()
        
        
    }
    func defaultSetting() {
        if let userDefault = UserDefaults.standard.object(forKey: "BooksList") as? String {
            NYTAPIClient.searchBooks(category: userDefault.replacingOccurrences(of: " ", with: "-")) { (appError, data) in
                if let appError = appError {
                    print(appError.errorMessage())
                } else if let nytbooks = data {
                    self.nytBooks = nytbooks
                    
                }// change the cv when setting pv pick something
            }
        }
        // always unwarpping things when we use userDefalut
        if let pickerViewDefault = UserDefaults.standard.object(forKey: "PickerView") as? String {
            self.firstView.firstPickerView.selectRow(Int(pickerViewDefault)!, inComponent: 0, animated: true) //at first it didnt works, but back to settingVC change the Int to String(Int) it will works!
        } // picker row for the first vc when setting pv selecte something(call Int because its row = number)
    }

  
}
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            }
            if let imageData = data {
                
                self.bookDescription = imageData[0].volumeInfo.description
                
                let imageToSet = imageData[0].volumeInfo.imageLinks.smallThumbnail
                ImageHelper.fetchImageFromNetwork(urlString: (imageToSet) ) { (appError, image) in
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = nytBooks[indexPath.row]
        guard let cell = collectionView.cellForItem(at: indexPath) as? FirstCell else { return }
        
        let detailVC = DetailViewController()
        
        detailVC.detailShow = book
        detailVC.imageOfBooks = cell.bestBookImage.image
        detailVC.descriptionOfBooks = bookDescription
       
        navigationController!.pushViewController(detailVC, animated: true)
        
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
