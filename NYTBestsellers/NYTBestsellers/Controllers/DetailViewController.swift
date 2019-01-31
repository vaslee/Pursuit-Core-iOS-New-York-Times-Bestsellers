//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    public var detailShow: BooksInfo?
    public var imageOfBooks: UIImage?
    public var descriptionOfBooks: String?

    
    let detailView = DetailView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoritePressed))
        
        view.backgroundColor = .white
        view.addSubview(detailView)
        setupData()

        
    }
    func setupData() {
        if let authors = detailShow?.book_details[0].author {
            detailView.detailAuthorsName.text = authors
        }
        
        if let images = imageOfBooks {
            detailView.detailBookImage.image = images
        }
        
        if let descriptions = descriptionOfBooks {
            detailView.detailDescriptionOfBook.text = descriptions
        }
        
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func favoritePressed() {
        
        
        if let image = detailView.detailBookImage.image, let authors = detailView.detailAuthorsName.text, let escription = detailView.detailDescriptionOfBook.text {

//            let date = Date()
//            let isoDateFormatter = ISO8601DateFormatter()
//            isoDateFormatter.formatOptions = [.withFullDate, .withFullTime, .withInternetDateTime, .withTimeZone,.withDashSeparatorInDate]
//
//            let timestamp = isoDateFormatter.string(from: date)
//
            let timestamp = Date.getISOTimestamp()
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                return print("no image data")
            }
            guard let descriptions = detailView.detailDescriptionOfBook.text else {
                return print("no descriptions data")
            }
            guard let authors = detailView.detailAuthorsName.text else {
                return print("no authors data")
            }
//
            
            let favortie = Favorite.init(createdAt: timestamp, imageData: imageData, author: authors, description: descriptions)
            
            if let bookDetail = detailShow {
                BooksModel.addBook(item: favortie)
                showAlert(title: "Save", message: "Image Saved")
            }
            
        }
        
    }

}
