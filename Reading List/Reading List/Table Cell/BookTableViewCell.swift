//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book: Book?
    weak var delegate: BookTableVewCellDelegate?
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var readBooks: UIButton!
    
    func updateViews() {
        guard let book = book else { return }
        
        bookLabel.text = book.title
        if book.hasBeenRead == true {
            readBooks.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            readBooks.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }

    @IBAction func readBooksTapped(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
}
