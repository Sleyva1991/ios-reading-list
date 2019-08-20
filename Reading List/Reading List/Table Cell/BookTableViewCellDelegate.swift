//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Steven Leyva on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableVewCellDelegate: class {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
