//
//  Categories.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let results: [CategoriesWarpper]
}

struct CategoriesWarpper: Codable {
    let list_name: String
    let display_name: String
    let list_name_encoded: String
    let oldest_published_date: String
    let newest_published_date: String
    let updated: String
}
