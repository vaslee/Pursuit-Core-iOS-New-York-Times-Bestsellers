//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func pickerColors2(color: UIColor)
}

class SettingsView: UIView {

    var PickerView2: [String] = [String]()
    
    weak var delegate: SettingsViewControllerDelegate?
    
    lazy var secondPickerView: UIPickerView = {
        let pv2 = UIPickerView()
        
        pv2.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        return pv2
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: UIScreen.main.bounds)
        addSubview(secondPickerView)
        setupSecondPickerViewConstraints()
        secondPickerView.dataSource = self
        secondPickerView.delegate = self
        PickerView2 = ["blue", "yellow", "black", "green"]
        
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


extension SettingsView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerView2.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerView2[row]
    }
    
}

extension SettingsView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            self.delegate?.pickerColors2(color: .blue)
        case 1:
            self.delegate?.pickerColors2(color: .yellow)
        case 2:
            self.delegate?.pickerColors2(color: .black)
        case 3:
            self.delegate?.pickerColors2(color: .green)
        default:
            print("No data")
            
        }
    }
}
