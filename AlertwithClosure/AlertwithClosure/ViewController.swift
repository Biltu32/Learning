//
//  ViewController.swift
//  AlertwithClosure
//
//  Created by DAPL-Asset-210 on 28/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var labelShowName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func showingAlert (title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Continue", style: .default, handler: { Action in
            print("Continue Alert button click")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ Action in
            print("Cancel Alert button click")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnSAVE(_ sender: UIButton) {
        if txtfldName.text!.isEmpty {
            showingAlert(title:"NAME", message:"Enter Your Name")
        }
        else {
            labelShowName.text = txtfldName.text
            let mnstbd = UIStoryboard(name: "Main", bundle:Bundle.main)
            let nextpage = mnstbd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            nextpage.name = labelShowName.text
            self.navigationController?.pushViewController(nextpage, animated: true)
        }
    }
}

