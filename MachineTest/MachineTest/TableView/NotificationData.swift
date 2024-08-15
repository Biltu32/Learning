//
//  NotificationData.swift
//  MachineTest
//
//  Created by DAPL-Asset-210 on 07/08/24.
//

import UIKit

class NotificationData: UITableViewCell {

    @IBOutlet weak var profileImageView : UIImageView!
    @IBOutlet weak var notificationLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
