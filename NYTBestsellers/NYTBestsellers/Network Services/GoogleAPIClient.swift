//
//  GoogleAPIClient.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleAPIClient {
    
    static func searchGoogle(isbn: String, completionHandler: @escaping (AppError?, BooksWapper?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=\(isbn)&key=\(SecretKeys.GoogleKey)", handler: { (appError, data) in
    
            if let appError = appError {
                completionHandler(appError, nil)
            }
            
            if let data = data {
                do {
                    let googleBooksData = try JSONDecoder().decode(GoogleBooks.self, from: data)
                    
                    completionHandler(nil, googleBooksData.items!.first?.volumeInfo)
                  
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    )}
    
}
