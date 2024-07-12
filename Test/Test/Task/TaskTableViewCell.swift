//
//  TaskTableViewCell.swift
//  Test
//
//  Created by DAPL-Asset-210 on 21/12/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
   
    @IBOutlet weak var labelNameis : UILabel!
    @IBOutlet weak var labeEmailis : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
