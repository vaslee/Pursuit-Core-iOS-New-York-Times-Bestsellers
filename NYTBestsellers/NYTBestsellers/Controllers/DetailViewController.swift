//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detail = [BooksInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.detailView.reloadInputViews()
            }
        }
    }
    let detailView = DetailView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoritePressed))
        
        view.backgroundColor = .white
        view.addSubview(detailView)
//        
//        GoogleAPIClient.searchGoogle(isbn: detail[0].book_details[0].primary_isbn13) { (error, data) in
//            if let error = error {
//                print(error.errorMessage())
//            } else if let data = data {
//                ImageHelper.fetchImageFromNetwork(urlString: (data.imageLinks.smallThumbnail) ) { (appError, image) in
//                    if let appError = appError {
//                        print(appError.errorMessage())
//                        
//                    }else if let image = image {
//                        self.detailView.detailBookImage.image = image
//                    }
//                }
//            }
//        }
        
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func favoritePressed() {
        
        
        
        showAlert(title: "Save", message: "Book Saved")
    }

}
