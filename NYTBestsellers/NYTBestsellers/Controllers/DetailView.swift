//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class DetailView: UIView {

    lazy var detailBookImage: UIImageView = {
        let iv = UIImageView()
        
        
        return iv
    }()
    
    lazy var detailAuthorsName: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        return label
    }()
    
    lazy var detailDescriptionOfBook: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.textColor = .yellow
        textView.backgroundColor = .black
        
        return textView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        updateDeatilData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateDeatilData()
    }
    
    private func updateDeatilData() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupDetail()
    }

}
extension DetailView {
    private func setupDetail() {
        setDetailBookImageConstraints()
        setDetailAuthorsNameConstraints()
        setDetailDescriptionOfBookConstraints()
       
    }
    
    
    
    func setDetailBookImageConstraints() {
        addSubview(detailBookImage)
        detailBookImage.translatesAutoresizingMaskIntoConstraints = false
        detailBookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        detailBookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailBookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        detailBookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func setDetailAuthorsNameConstraints() {
        addSubview(detailAuthorsName)
        detailAuthorsName.translatesAutoresizingMaskIntoConstraints = false
        detailAuthorsName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailAuthorsName.topAnchor.constraint(equalTo: detailBookImage.bottomAnchor, constant: 5).isActive = true
        detailAuthorsName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailAuthorsName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailAuthorsName.font = UIFont.boldSystemFont(ofSize: 25.0)
    }
    
    func setDetailDescriptionOfBookConstraints() {
        addSubview(detailDescriptionOfBook)
        detailDescriptionOfBook.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionOfBook.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailDescriptionOfBook.topAnchor.constraint(equalTo: detailAuthorsName.bottomAnchor, constant: 20).isActive = true
        detailDescriptionOfBook.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        detailDescriptionOfBook.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        detailDescriptionOfBook.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        detailDescriptionOfBook.font = UIFont.systemFont(ofSize: 20)
    }
    
}
