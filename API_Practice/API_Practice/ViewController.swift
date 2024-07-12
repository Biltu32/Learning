//
//  ViewController.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 02/02/24.
//

import UIKit

class ViewController: UIViewController {

    var responsePost : [PostResponse] = []
    @IBOutlet weak var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postAPIcalling()
        tblvw.delegate = self
        tblvw.dataSource = self
    }

    func postAPIcalling () {
        API_Manager.sharedInstance.getCountry { result, status, message in
            guard let response = result else {return}
            self.responsePost = response
            for i in 0...self.responsePost.count - 1 {
                print(self.responsePost[i].title )
                self.tblvw.reloadData()
            }
        }
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        responsePost.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tblvw.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! APITableViewCell
//        let data = responsePost[indexPath.row]
        cellData.labelData.text = responsePost[indexPath.row].title
        return cellData
    }
    

}
