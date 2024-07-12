//
//  ViewController.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var responsePost : [GetResponse] = []
    @IBOutlet weak var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postAPIcalling()
        tableviewShow()
    }
    
    func postAPIcalling () {
        API_Manager.sharedInstance.getDetails { result, status, message in
            guard let response = result else {return}
            self.responsePost = response
            DispatchQueue.main.async {
                self.tableviewShow()
                self.tblvw.reloadData()
            }
        }
    }
    
    func tableviewShow() {
        tblvw.delegate = self
        tblvw.dataSource = self
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return responsePost.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tblvw.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! APITableViewCell
        let show = responsePost[indexPath.row]
        cellData.labelUserID.text = String(show.userID)
        cellData.labelID.text = String(show.id)
        cellData.labelTitle.text = show.title
        cellData.labelBody.text = show.body
        return cellData
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
