//
//  TableViewCell.swift
//  Practise
//
//  Created by DAPL-Asset-210 on 05/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelCountryname : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
