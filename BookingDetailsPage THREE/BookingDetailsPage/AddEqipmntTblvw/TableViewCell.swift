//
//  TableViewCell.swift
//  BookingDetailsPage
//
//  Created by DAPL-Asset-210 on 18/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelItem:UILabel!
    @IBOutlet weak var labelQuantity:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
