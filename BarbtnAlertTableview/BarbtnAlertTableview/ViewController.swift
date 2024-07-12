//
//  ViewController.swift
//  BarbtnAlertTableview
//
//  Created by DAPL-Asset-210 on 22/12/23.
//

import UIKit
struct Person {
    var name : String?
    var email : String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var barbtnitemtoADD : UIBarButtonItem!
    @IBOutlet weak var tblview : UITableView!
    var nameArray : [Person] = []
    var details = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        tblview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblview.delegate = self
        tblview.dataSource = self
    }
    
    @IBAction func btnforAlert(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "ALERT", message: " ", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Your Name"
        }
        alert.addTextField { (textFieldEmail) in
            textFieldEmail.placeholder = "Enter Your Email"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            let textFieldEmail = alert.textFields![1]
            self.details.name = textField.text
            self.details.email =  textFieldEmail.text
            self.nameArray.append(self.details)
            self.tblview.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celldata = tblview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let  data = nameArray[indexPath.row]
        celldata.labelName.text = "Name: " + (data.name ?? "ZZZ")
        celldata.labelEmail.text = "Email:" + (data.email ?? "zzz@gmail.com")
        return celldata
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
