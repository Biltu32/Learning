//
//  AddExtension.swift
//  MachineTest
//
//  Created by DAPL-Asset-210 on 07/08/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func txtfldPadding(txtfldpadding:UITextField) {
        txtfldpadding.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: txtfldpadding.frame.height))
        txtfldpadding.leftViewMode = .always
    }
    
    func  textfieldPlaceholderSetup(myTextfield:String ) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(rgb: 0x2699FB).cgColor
        self.attributedPlaceholder = NSAttributedString(
            string: myTextfield, attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x2699FB)])
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


