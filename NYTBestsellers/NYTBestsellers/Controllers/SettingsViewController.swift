//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingCategories = [CategoriesWarpper](){
        didSet{
            DispatchQueue.main.async {
                self.settingView.secondPickerView.reloadAllComponents()
            }
        }
    }
    var settingView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(settingView)
        settingView.secondPickerView.dataSource = self
        settingView.secondPickerView.delegate = self
        CategoriesAPIClient.searchCategories { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let settingCategories = data {
                self.settingCategories = settingCategories

            }
        }
    }


}
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingCategories.count

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingCategories[row].list_name
    }

}
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(settingCategories[row].list_name, forKey: "BooksList")
        UserDefaults.standard.set(String(row), forKey: "PickerView")//set new file name
        
    }
}
