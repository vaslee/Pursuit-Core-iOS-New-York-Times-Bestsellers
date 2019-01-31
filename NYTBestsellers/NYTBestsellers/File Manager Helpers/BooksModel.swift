//
//  BooksModel.swift
//  NYTBestsellers
//
//  Created by TingxinLi on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class BooksModel {
    private static let filename = "BooksList.plist"
    private static var booksData = [Favorite]()
    
    
    static func saveBooks() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(booksData)
            
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    
    static func getBooks() -> [Favorite] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    booksData = try PropertyListDecoder().decode([Favorite].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return booksData
    }
    
    static func addBook(item: Favorite) {
        
        booksData.append(item)
        saveBooks()
    }
    
    static func delete(atIndex index: Int) {
        booksData.remove(at: index)
        saveBooks()
    }
}
