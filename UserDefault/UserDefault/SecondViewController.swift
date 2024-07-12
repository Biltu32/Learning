//
//  SecondViewController.swift
//  UserDefault
//
//  Created by DAPL-Asset-210 on 14/02/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelGreeting:UILabel!
    var name :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelGreeting.text = "WelCome: " + (name ?? "")
    }
    
}
