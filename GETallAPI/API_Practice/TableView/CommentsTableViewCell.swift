//
//  CommentsTableViewCell.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelUserID:UILabel!
    @IBOutlet weak var labelID:UILabel!
    @IBOutlet weak var labelName:UILabel!
    @IBOutlet weak var labelEmail:UILabel!
    @IBOutlet weak var labelBody:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
