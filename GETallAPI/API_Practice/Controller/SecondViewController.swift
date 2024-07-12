//
//  SecondViewController.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import UIKit

class SecondViewController: UIViewController {
 
    var responsePost: GetResponseNumber?
    var baseURL = "https://jsonplaceholder.typicode.com/posts/"
    
    @IBOutlet weak var txtfldID: UITextField!
    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelUserID: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldID.becomeFirstResponder()
    }
    func getAPIcalling (baseUrl: String) {
        API_Manager.sharedInstance.getDetailsNumber(baseURL: baseUrl) { result, status, message in
        guard let response = result else {return}
        self.responsePost = response
        DispatchQueue.main.async {
            self.labelID.text = "ID: " + String(self.responsePost?.id ?? 0)
            self.labelUserID.text = "UserID: " + String(self.responsePost?.userID ?? 0)
            self.labelTitle.text = "Title: " + (self.responsePost?.title ?? "")
            self.labelBody.text = "Body: " + (self.responsePost?.body ?? "")
                }
        }
    }
    func showingAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnforCheck(_ sender: UIButton){
        if txtfldID.text == "" {
            showingAlert(title: "ALERT", message: "Please Enter any id")
        }
        else {
            print("Full URL ==> \(baseURL + (txtfldID.text ?? ""))")
            getAPIcalling(baseUrl:baseURL + (txtfldID.text ?? ""))
            txtfldID.text = ""
        }
    }
}
