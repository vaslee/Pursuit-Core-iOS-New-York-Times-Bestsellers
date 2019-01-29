//
//  GoogleBooks.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBooks: Codable {
    let items: [GBooksInfo]?
}

struct GBooksInfo: Codable {
    let volumeInfo: BooksWapper?
}

struct BooksWapper: Codable {
    let title: String
    let authors: [String]
    let publisher: String?
    let description: String?
    let imageLinks: ImageWarpper
}

struct ImageWarpper: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
