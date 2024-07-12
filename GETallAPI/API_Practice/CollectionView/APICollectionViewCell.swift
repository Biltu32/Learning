//
//  APICollectionViewCell.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 15/02/24.
//

import UIKit

class APICollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelID :UILabel!
    @IBOutlet weak var labelTitle :UILabel!
    @IBOutlet weak var cellView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 10
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor = UIColor.orange.cgColor
    
    }

    
}
