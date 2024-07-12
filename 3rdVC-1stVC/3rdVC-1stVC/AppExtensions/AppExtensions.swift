//  AppExtensions.swift
//  3rdVC-1stVC
//  Created by DAPL-Asset-288 on 04/04/24.

// ei rokam label,button,textfield,view,imageview sob kichure regular setup kore nbo ekhane


import Foundation
import UIKit

extension UITextField {
    func txtFldSetup(yourTxtfld: UITextField) {
        yourTxtfld.layer.cornerRadius = 10
        yourTxtfld.layer.borderWidth = 2
        yourTxtfld.layer.borderColor = UIColor.gray.cgColor
    }
    
    func txtfldPadding(txtfldpadding:UITextField) {
        txtfldpadding.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: txtfldpadding.frame.height))
        txtfldpadding.leftViewMode = .always
    }
}

extension UIButton {
    func buttonSetup(yourButton: UIButton) {
        yourButton.layer.cornerRadius = 10
        yourButton.layer.borderWidth = 2
        yourButton.layer.borderColor = UIColor.orange.cgColor
    }
}

extension UILabel {
    func labelSetup(yourLabel: UILabel) {
        yourLabel.layer.cornerRadius = 10
        yourLabel.layer.borderWidth = 2
        yourLabel.layer.borderColor = UIColor.gray.cgColor
    }
}
