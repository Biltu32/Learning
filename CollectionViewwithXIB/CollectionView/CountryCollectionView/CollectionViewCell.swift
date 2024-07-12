//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by DAPL-Asset-210 on 04/01/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewwithImageandName: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageview.layer.cornerRadius = 10
    }

}
