//
//  SecondVC.swift
//  3rdVC-1stVC
//
//  Created by DAPL-Asset-210 on 01/04/24.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var labelDetails: UILabel!
    @IBOutlet weak var btnforSave: UIButton!
    var a : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
        
    func initialSetup() {
        labelDetails.text = a
        btnforSave.buttonSetup(yourButton: btnforSave)
        labelDetails.labelSetup(yourLabel: labelDetails)
    }
    
    @IBAction func btnfor3rdVC(_ sender: UIButton) {
        let nextVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        nextVC.b = labelDetails.text
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
