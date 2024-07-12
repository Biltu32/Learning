//
//  ViewController.swift
//  TableViewDatadelete
//
//  Created by DAPL-Asset-210 on 29/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var tblvw: UITableView!
    
    var detailsArray : [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let savedData = UserDefaults.standard.value(forKey: "savetoSHOW") as? [String] {
//            detailsArray = savedData
//        }
        tblvw.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblvw.delegate = self
        tblvw.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    
    @IBAction func BtnforSAVE(_ sender: UIButton) {
        detailsArray.append(txtfldName.text!)
        txtfldName.text = ""
        tblvw.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celldata = tblvw.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! TableViewCell
        celldata.labelName.text = detailsArray[indexPath.row]
        return celldata
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .destructive, title: "Edit", handler: {_,_,_ in
            let alert = UIAlertController(title:"EDIT", message: "Please enter details", preferredStyle: .alert)
            alert.addTextField(configurationHandler: {(textField) in
                textField.text = self.detailsArray[indexPath.row]
            })
            
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { [self](updateAction) in
                self.detailsArray[indexPath.row] = alert.textFields!.first!.text!
                self.tblvw.reloadRows(at: [indexPath], with: .fade)
//                UserDefaults.standard.set(detailsArray, forKey: "savetoSHOW")
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel",style:.destructive,handler:nil))
            self.present(alert, animated: false)
        })
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {_,_,_ in
            self.detailsArray.remove(at: indexPath.row)
            tableView.reloadData()
        })
        let result = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        return result
    }
}
