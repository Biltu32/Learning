//
//  SecondViewController.swift
//  Practise
//
//  Created by DAPL-Asset-210 on 05/01/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelcountry: UILabel!
    @IBOutlet weak var labelyears: UILabel!
    
    var name : String?
    var tblvwCountry: String?
    var collectionvwYears: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelname.text = "NAME:" + " " + (name ?? "")
        labelcountry.text = "Country:" + " " + (tblvwCountry ?? "")
        labelyears.text = "Years:" + " " + (collectionvwYears ?? "") 
    }
}
