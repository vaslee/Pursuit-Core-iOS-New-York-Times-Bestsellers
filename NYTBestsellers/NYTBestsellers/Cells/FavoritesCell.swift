//
//  FavoritesCell.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    lazy var bookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "sledgehammer"))
        
        
        return iv
    }()
    
    lazy var authorsName: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1) //设置字体颜色
        label.text = "I'm here!"
        label.textAlignment = .center //把字体放在中间
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) // 设置字体背景颜色
        
        return label
    }()
    
    lazy var descriptionOfBook: UITextView = {
        let textView = UITextView()
        textView.text = "Sloth, Manny and Me are the best Friends"
        textView.textColor = .yellow
        textView.backgroundColor = .black
        
        return textView
    }()
    
    lazy var alertButton: UIButton = {
        let button = UIButton()
       
        button.setTitle("● ● ●", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        return button
    }()
    
    @objc func alertAction() {
        alertButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        let alert = UIAlertController(title: "What do you need?", message: "Please Select an Option", preferredStyle: .actionSheet)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in })
        
        alert.addAction(deleteButton)
        alert.addAction(cancelButton)
        //present(alert, animated: true, completion: nil)
        print("Whats up")
    }
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        updateData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateData()
    }
    
    private func updateData() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupCells()
    }
    
}
extension FavoritesCell {
    private func setupCells() {
        setBookImageConstraints()
        setAuthorsNameConstraints()
        setDescriptionOfBookConstraints()
        setAlertButtonConstraints()
    }
    
    
    
    func setBookImageConstraints() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
    
    func setAuthorsNameConstraints() {
        addSubview(authorsName)
        authorsName.translatesAutoresizingMaskIntoConstraints = false
        authorsName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        authorsName.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 5).isActive = true
        authorsName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        authorsName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setDescriptionOfBookConstraints() {
        addSubview(descriptionOfBook)
        descriptionOfBook.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfBook.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionOfBook.topAnchor.constraint(equalTo: authorsName.bottomAnchor, constant: 5).isActive = true
        descriptionOfBook.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        descriptionOfBook.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        descriptionOfBook.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func setAlertButtonConstraints() {
        addSubview(alertButton)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    
}
