//
//  TableViewCell.swift
//  Test
//
//  Created by DAPL-Asset-210 on 19/12/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgvwDP : UIImageView!
    @IBOutlet weak var labelEmail : UILabel!
    @IBOutlet weak var labelDOB : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
}
