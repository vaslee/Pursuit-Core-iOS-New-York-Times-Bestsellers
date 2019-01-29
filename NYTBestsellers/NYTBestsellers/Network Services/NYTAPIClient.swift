//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTAPIClient {
    
    static func searchBooks(category: String,completionHandler: @escaping (AppError?, [BooksInfo]?) -> Void) {
        let category = category.replacingOccurrences(of: " ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.NYTKey)&list=\(category)", handler: { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(NYTBooks.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    )}
    
}
