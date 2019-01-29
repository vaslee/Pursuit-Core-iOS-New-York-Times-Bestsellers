//
//  NYTBooks.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBooks: Codable {
    let results: [BooksInfo]
}

struct BooksInfo: Codable {
    let list_name: String
    let display_name: String
    let weeks_on_list: Int
    let amazon_product_url: String
    let book_details: [BookWarpper]
}

struct BookWarpper: Codable {
    let title: String
    let description: String
    let author: String
    let primary_isbn13: String
}
