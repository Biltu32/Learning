//
//  ViewController.swift
//  3rdVC-1stVC
//
//  Created by DAPL-Asset-210 on 01/04/24.
//

import UIKit

var user : String?

class FirstVC : UIViewController {
    
    @IBOutlet weak var txtfldDetails: UITextField!
    @IBOutlet weak var btnforOK: UIButton!
    @IBOutlet weak var lblShowLater: UILabel!
    
    var appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldDetails.becomeFirstResponder()
        txtfldDetails.text = ""
    }
    
    func initialSetup() {
        txtfldDetails.txtFldSetup(yourTxtfld: txtfldDetails)
        txtfldDetails.txtfldPadding(txtfldpadding: txtfldDetails)
        btnforOK.buttonSetup(yourButton: btnforOK)
        lblShowLater.labelSetup(yourLabel: lblShowLater)
        lblShowLater.isHidden = true
        //MARK: - Getting User name from third VC
    NotificationCenter.default.addObserver(self, selector: #selector(userName(notification: )), name: .userName, object: nil)
    }
    
    @objc func userName(notification: Notification) {
        print("Helllooooo")
        lblShowLater.isHidden = false
        lblShowLater.text = appDel.name
    }
    
    func showAlert (title :String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnfor2ndVC(_ sender: UIButton) {
        if txtfldDetails.text == "" {
            showAlert(title: "ALERT", message: "Enter Your Details")
        }
        else {
            let nextVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            nextVC.a = txtfldDetails.text
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension Notification.Name {
    static let userName = Notification.Name("Name")
}
