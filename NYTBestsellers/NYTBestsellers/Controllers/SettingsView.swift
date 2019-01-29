//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class SettingsView: UIView {
    
    lazy var secondPickerView: UIPickerView = {
        let pv2 = UIPickerView()
        
        pv2.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        return pv2
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: UIScreen.main.bounds)
        addSubview(secondPickerView)
        setupSecondPickerViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSecondPickerViewConstraints() {
        secondPickerView.translatesAutoresizingMaskIntoConstraints = false
        secondPickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondPickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        secondPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        secondPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
    }
    
}

