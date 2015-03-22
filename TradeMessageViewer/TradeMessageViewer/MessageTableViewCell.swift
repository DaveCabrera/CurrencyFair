//
//  MessageTableViewCell.swift
//  TradeMessageViewer
//
//  Created by David Cabrera on 3/21/15.
//  Copyright (c) 2015 David Cabrera. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet var originCountry: UIImageView!
    @IBOutlet var transactionId: UILabel!
    @IBOutlet var userId: UILabel!
    @IBOutlet var timePlaced: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
