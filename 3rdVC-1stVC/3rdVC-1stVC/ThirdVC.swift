//
//  ThirdVC.swift
//  3rdVC-1stVC
//
//  Created by DAPL-Asset-210 on 01/04/24.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var labelPreviousData: UILabel!
    @IBOutlet weak var txtfldEditable: UITextField!
    @IBOutlet weak var btnforCONTINUE: UIButton!
    var b :String?
    
    var appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        labelPreviousData.text = "Previous Data:" + (b ?? "NIL")
        txtfldEditable.txtFldSetup(yourTxtfld: txtfldEditable)
        txtfldEditable.txtfldPadding(txtfldpadding: txtfldEditable)
        btnforCONTINUE.buttonSetup(yourButton: btnforCONTINUE)
        txtfldEditable.becomeFirstResponder()
    }
    
    @IBAction func btnfor1stVC(_ sender: UIButton) {
        appDel.name = txtfldEditable.text
        NotificationCenter.default.post(name: .userName, object: nil)
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: FirstVC.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}





