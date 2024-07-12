//
//  ViewController.swift
//  Test
//
//  Created by DAPL-Asset-210 on 19/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var btnLOGIN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults()
        setupTxtfld(textfield: txtfldName)
        setupTxtfld(textfield: txtfldPassword)
        btnLOGIN.layer.cornerRadius = 10
        btnLOGIN.layer.borderWidth = 1
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func setupTxtfld(textfield:UITextField){
        textfield.layer.cornerRadius = 10
        textfield.layer.borderWidth = 1
    }
    func userDefaults() {
        if UserDefaults.standard.bool(forKey: "login") == true {
            let mainstybd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mainstybd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.navigationController?.pushViewController(nextpage,animated: true)
        }
    }
    
    func isValidName(name:String) -> Bool {
        let username = "[A-Z a-z]{3,}"
        let usernamecheck = NSPredicate(format: "SELF MATCHES %@",username)
        let result = usernamecheck.evaluate(with: name)
        return result
    }
    
    func isValidPassword(password:String) -> Bool {
        let userpassword = "[A-Z a-z]{6,}"
        let userpasswordcheck = NSPredicate(format: "SELF MATCHES %@",userpassword)
        let result = userpasswordcheck.evaluate(with: password)
        return result
    }
    
    func showAlert(title:String,message:String) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnLOGIN(_ sender: UIButton) {
        if txtfldName.text == "" {
            showAlert(title: "NAME", message: "Please Enter Your Name")
        }
        else if txtfldPassword.text == "" {
            showAlert(title: "PASSWORD", message: "Please Enter Your Password")
        }
        else if isValidName(name: txtfldName.text ?? "") != true {
            showAlert(title: "NAME", message: "This Name is not Valid")
        }
        else if isValidPassword(password: txtfldPassword.text ?? "") != true {
            showAlert(title: "PASSWORD", message: "This Password is not Valid")
        }
        else {
            let mainstybd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mainstybd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            UserDefaults.standard.set(true, forKey: "login")
            self.navigationController?.pushViewController(nextpage,animated: true)
        }
    }
    
}

