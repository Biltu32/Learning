//
//  FourthViewController.swift
//  Test
//
//  Created by DAPL-Asset-210 on 21/12/23.
//

import UIKit
 
struct Person {
    var name1 : String?
    var email1 : String?
}

class FourthViewController: UIViewController {

    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var tblvwwithTwolabel: UITableView!
    var allArray : [Person] = []
    var detailsData = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func initialSetup() {
        txtfldSetup(textfld: txtfldName)
        txtfldSetup(textfld: txtfldEmail)
        tblvwwithTwolabel.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblvwwithTwolabel.delegate = self
        tblvwwithTwolabel.dataSource = self
    }
    
    func txtfldSetup(textfld: UITextField) {
        textfld.layer.cornerRadius = 10
        textfld.layer.borderWidth = 1
        textfld.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func btnSAVE(_ sender: UIButton) {
        detailsData.name1 = txtfldName.text!
        detailsData.email1 = txtfldEmail.text!
        allArray.append(detailsData)
        tblvwwithTwolabel.reloadData()
    }
}

extension FourthViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tblvwwithTwolabel.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TaskTableViewCell
        let  alldata = allArray[indexPath.row]
        cellData.labelNameis.text = "Name: " + (alldata.name1 ?? "ZZZ")
        cellData.labeEmailis.text =  "Email: " + (alldata.email1 ?? "zzz@gmail.com")
        return cellData
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
