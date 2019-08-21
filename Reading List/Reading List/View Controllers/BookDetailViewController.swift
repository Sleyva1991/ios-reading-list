//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?
    
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = bookTextField.text, !title.isEmpty,
            let details = detailTextView.text, !details.isEmpty else { return }
        
        if let book = book {
            bookController?.updateBooks(book: book, title: title, reasonToRead: details)
        } else {
            bookController?.createBooks(title: title, reasonToRead: details)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let book = book else { return }
        
        title = book.title
        bookTextField.text = book.title
        detailTextView.text = book.reasonToRead
        
        if book.title.isEmpty {
            title = "Add a New Book"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
