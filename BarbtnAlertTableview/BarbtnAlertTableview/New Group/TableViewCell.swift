//
//  TableViewCell.swift
//  BarbtnAlertTableview
//
//  Created by DAPL-Asset-210 on 22/12/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelName : UILabel!
    @IBOutlet weak var labelEmail : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
