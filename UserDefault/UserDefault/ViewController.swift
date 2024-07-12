//
//  ViewController.swift
//  UserDefault
//
//  Created by DAPL-Asset-210 on 14/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldEmailId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialShow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func initialShow() {
        if UserDefaults.standard.bool(forKey: "LogIN") == true {
            let mnstbd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mnstbd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            let value = UserDefaults.standard.string(forKey: "Name") ?? "NIL"
            nextpage.name = value
            self.navigationController?.pushViewController(nextpage, animated: true)
        }
    }
    
    func showingAlert (title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnforLogIN(_ sender: UIButton) {
        if txtfldName.text == "" {
            showingAlert(title: "NAME", message: "Please Enter Your Name")
        }
        else if txtfldEmailId.text == "" {
            showingAlert(title: "EMAIL", message: "Please Enter Your Email")
        }
        else {
            let mnstbd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mnstbd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            UserDefaults.standard.set(true, forKey: "LogIN")
            UserDefaults.standard.set(txtfldName.text, forKey: "Name")
            nextpage.name = txtfldName.text
            navigationController?.pushViewController(nextpage, animated: true)
        }
    }
}

