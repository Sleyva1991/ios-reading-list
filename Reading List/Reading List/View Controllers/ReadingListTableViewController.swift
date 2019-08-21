//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController, BookTableVewCellDelegate {
    
    let bookController = BookController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }

    // MARK: - Table view data source
    
    func toggleHasBeenRead(for cell: BookTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let book = allBooks(indexPath: indexPath)
        bookController.hasBeenRead(book: book)
        tableView.reloadData()
    }
    
    func allBooks(indexPath: IndexPath) -> Book {
        if indexPath.section == 0 {
            return bookController.readBooks[indexPath.row]
        } else {
            return bookController.unreadBooks[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let read = bookController.readBooks.isEmpty ? nil : "Read"
        let unread = bookController.unreadBooks.isEmpty ? nil : "Unread"
        
        return section == 0 ? read : unread
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bookController.readBooks.count
        } else {
            return bookController.unreadBooks.count
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        
        let book = allBooks(indexPath: indexPath)
        cell.book = book
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let book = allBooks(indexPath: indexPath)
        if editingStyle == .delete {
            bookController.deleteBooks(book: book)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            guard let addDetailVC = segue.destination as? BookDetailViewController else { return }
            
            addDetailVC.bookController = bookController
        } else if segue .identifier == "CellSegue" {
            guard let showDetailVC = segue.destination as? BookDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            let book = allBooks(indexPath: indexPath)
            
            showDetailVC.bookController = bookController
            showDetailVC.book = book
        }
        
    }

}
