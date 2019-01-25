//
//  FirstCell.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FirstCell: UICollectionViewCell {
    
    lazy var bestBookImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "sledgehammer"))
        
        
        return iv
    }()
    
    lazy var weeksOnListLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1) //设置字体颜色
        label.text = "I'm here!"
        label.textAlignment = .center //把字体放在中间
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // 设置字体背景颜色
        
        return label
    }()
    
    lazy var firstDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Sloth, Manny and Me are the best Friends"
        textView.textColor = .yellow
        textView.backgroundColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        
        return textView
    }()
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        setupCells()
    }
    
    
    
    
    
    
}
extension FirstCell {
    private func setupCells() {
        setBestBookImageConstraints()
        setWeeksOnListLabelConstraints()
        setFirstDescriptionTextViewConstraints()
        
    }
    
    
    
    func setBestBookImageConstraints() {
        addSubview(bestBookImage)
        bestBookImage.translatesAutoresizingMaskIntoConstraints = false
        bestBookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bestBookImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bestBookImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        bestBookImage.widthAnchor.constraint(equalToConstant: 90).isActive = true

    }
    
    func setWeeksOnListLabelConstraints() {
        addSubview(weeksOnListLabel)
        weeksOnListLabel.translatesAutoresizingMaskIntoConstraints = false
        weeksOnListLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weeksOnListLabel.topAnchor.constraint(equalTo: bestBookImage.bottomAnchor, constant: 5).isActive = true
        weeksOnListLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        weeksOnListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setFirstDescriptionTextViewConstraints() {
        addSubview(firstDescriptionTextView)
        firstDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        firstDescriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        firstDescriptionTextView.topAnchor.constraint(equalTo: weeksOnListLabel.bottomAnchor, constant: 5).isActive = true
        firstDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        firstDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        firstDescriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    
    
}
