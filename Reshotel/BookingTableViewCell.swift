//
//  BookingTableViewCell.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/23/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    var booking:Booking? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        
    }

}
