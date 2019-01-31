//
//  Favorties.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct Favorite: Codable {
    
    let createdAt: String
    let imageData: Data
    let author: String?
    let description: String?
    
}
