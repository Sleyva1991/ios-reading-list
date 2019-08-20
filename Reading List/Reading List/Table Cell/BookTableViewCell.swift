//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var readBooks: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func readBooksTapped(_ sender: Any) {
    }
    
}
