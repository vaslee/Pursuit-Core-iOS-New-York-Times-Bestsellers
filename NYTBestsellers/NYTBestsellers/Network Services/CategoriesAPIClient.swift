//
//  CategoriesAPIClient.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class CategoriesAPIClient {
    
    static func searchCategories(completionHandler: @escaping (AppError?, [CategoriesWarpper]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.NYTKey)", handler: { (appError, data) in
            
            if let appError = appError {
                completionHandler(appError, nil)
            }
            
            if let data = data {
                do {
                    let categoriesData = try JSONDecoder().decode(Categories.self, from: data)
                    
                    completionHandler(nil, categoriesData.results)
                    
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        )}
    
}
