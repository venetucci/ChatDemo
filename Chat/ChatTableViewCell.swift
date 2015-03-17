//
//  ChatTableViewCell.swift
//  Chat
//
//  Created by Michelle Venetucci Harvey on 3/16/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
