//
//  ViewController.swift
//  MachineTest
//
//  Created by DAPL-Asset-210 on 07/08/24.
//

import UIKit

class LoginScreen: UIViewController {
    
    @IBOutlet weak var txtfldUsername: UITextField!
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var btnLOGIN: UIButton!
    
    var rightUserName = "Biltu Sarkar"
    var rightPassword = "123456"
    var wrongNamePasswordcount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup ()
    }
    
    
    func initialSetup (){
        txtfldUsername.txtfldPadding(txtfldpadding: txtfldUsername)
        txtfldPassword.txtfldPadding(txtfldpadding: txtfldPassword)
        txtfldUsername.textfieldPlaceholderSetup(myTextfield: "User Name")
        txtfldPassword.textfieldPlaceholderSetup(myTextfield: "Password")
    }
    
    func alertShow (title: String, message :String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidName(name:String) -> Bool {
        let username = "[A-Z a-z]{3,}"
        let usernamecheck = NSPredicate(format: "SELF MATCHES %@",username)
        let result = usernamecheck.evaluate(with: name)
        return result
    }
    
    
    
    func wrongNamepasswordcheck () {
        if  (txtfldUsername.text == "") {
            alertShow(title: "NAME", message: "Please enter your name")
        }
        else if (txtfldUsername.text == "")  {
            alertShow(title: "NAME", message: "Please enter SOME Name")
        }
        else if isValidName(name: txtfldUsername.text ?? "") != true {
            alertShow(title: "NAME", message: "Please enter your Correct name")
        }
        
        else if (txtfldPassword.text == "") {
            alertShow(title: "PASSWORD", message: "Please Enter your password")
        }
        
  
        else {
            if wrongNamePasswordcount >= 3 {
                alertShow(title: "Toast", message: "You are blocked from this app")
                btnLOGIN.isEnabled = false
                btnLOGIN.alpha = 0.2
            }
            
            else if  txtfldPassword.text != rightPassword {
               alertShow(title: "PASSWORD", message: "This Password is not Valid")
               wrongNamePasswordcount += 1
               print(wrongNamePasswordcount)
           }
            
            else {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextpage = mainStoryboard.instantiateViewController(withIdentifier: "NotificationScreen") as! NotificationScreen
                nextpage.username = txtfldUsername.text
                navigationController?.pushViewController(nextpage, animated: true)
            }
        }
    
    }
    
    
    
    
    @IBAction func btnforLogin(_ sender: UIButton) {
        wrongNamepasswordcheck()
    }

    
}

