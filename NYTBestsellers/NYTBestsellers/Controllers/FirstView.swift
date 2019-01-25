//
//  FirstView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: AnyObject {
    func pickerColor(color: UIColor)
}

class FirstView: UIView {
    
    var pickerColors: [String] = [String]()

    weak var delegate: FirstViewControllerDelegate?
    
    lazy var firstPickerView: UIPickerView = {
        let pv = UIPickerView()
      
        pv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return pv
    }()
    
    lazy var firstCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        
        let CV = UICollectionView.init(frame: bounds, collectionViewLayout: layout)
        CV.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        CV.dataSource = self
        CV.delegate = self
        
        return CV
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: UIScreen.main.bounds)
        addSubview(firstCollectionView)
        addSubview(firstPickerView)
        setupFirstPickerViewConstraints()
        setupFirstCollectionViewConstraints()
 
        
        
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
        pickerColors = ["blue", "yellow", "black", "green"]

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    func setupFirstPickerViewConstraints() {
        firstPickerView.translatesAutoresizingMaskIntoConstraints = false
        firstPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        firstPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        firstPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        firstPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
    }
    func setupFirstCollectionViewConstraints() {
        firstCollectionView.translatesAutoresizingMaskIntoConstraints = false
        firstCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        firstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        firstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}

extension FirstView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as? FirstCell else {
            return UICollectionViewCell() }
        return cell
    }
}

extension FirstView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColors.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerColors[row]
    }
    
}

extension FirstView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            self.delegate?.pickerColor(color: .blue)
        case 1:
            self.delegate?.pickerColor(color: .yellow)
        case 2:
            self.delegate?.pickerColor(color: .black)
        case 3:
            self.delegate?.pickerColor(color: .green)
        default:
            print("No data")
            
        }
    }
}
