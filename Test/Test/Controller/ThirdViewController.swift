//
//  ThirdViewController.swift
//  Test
//
//  Created by DAPL-Asset-210 on 19/12/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var profiledetailsArray : [Alldetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
    }
}

extension ThirdViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiledetailsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let details = profiledetailsArray[indexPath.row]
        cell.imgvwDP.image = details.image
        cell.labelEmail.text = "Email: " + (details.email ?? "xxzz@gmail.com")
        cell.labelDOB.text =  "DOB: " + (details.dateofbirth ?? "NIL")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

