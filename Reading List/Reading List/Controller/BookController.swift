//
//  BookController.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book] = []
    
    init() {
        loadFromPersistantStore()
    }
    
    var readingListURL: URL? {
        let fileManger = FileManager.default
        guard let documentsDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first  else { return nil }
        let finalURL = documentsDirectory.appendingPathComponent("books.plist")
        return finalURL
    }
    
    func saveToPersistantStore() {
        guard let url = readingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let bookData = try encoder.encode(books)
            try bookData.write(to: url)
        } catch {
            print("Error, No data to store: \(error)")
            
        }
    }
    
    func loadFromPersistantStore() {
        guard let url = readingListURL, FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodingBooks = try decoder.decode([Book].self, from: data)
            books = decodingBooks
        } catch {
            print("Error, failed to decode Books: \(error)")
        }
    }
    
    func createBooks(title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        
        saveToPersistantStore()
    }
    
    func deleteBooks(book: Book) {
        guard let index = books.index(of: book) else { return }
        books.remove(at: index)
        
        saveToPersistantStore()
    }
    
    func hasBeenRead(book: Book) {
        guard let index = books.index(of: book) else { return }
        books[index].hasBeenRead.toggle()
        
        saveToPersistantStore()
    }

    func updateBooks (book: Book, title: String, reasonToRead: String) {
        guard let index = books.index(of: book) else { return }
        books[index].title = title
        books[index].reasonToRead = reasonToRead
        
        saveToPersistantStore()
    }
    
    var readBooks: [Book] {
        let read =  books.filter { $0.hasBeenRead == true }
        return read
    }
    
    var unreadBooks: [Book] {
        let unread = books.filter { $0.hasBeenRead == false}
        return unread
    }
    
}
