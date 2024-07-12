//
//  SecondViewController.swift
//  AlertwithClosure
//
//  Created by DAPL-Asset-210 on 28/12/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelWelcome: UILabel!
    var name : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWelcome.text = "WelCome: " + name
    }
    
}
