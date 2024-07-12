//
//  ViewController.swift
//  BookingDetailsPage
//
//  Created by DAPL-Asset-210 on 16/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnofChat: UIButton!
    @IBOutlet weak var btnofCall: UIButton!
    @IBOutlet weak var tblvw: UITableView!
    @IBOutlet weak var viewforBikeDetails: UIView!
    @IBOutlet weak var viewforDeliveryDetails: UIView!
    @IBOutlet weak var viewforAdditionalDetails: UIView!
    @IBOutlet weak var viewforExtendrental: UIView!
    @IBOutlet weak var viewforChatandCall: UIView!
    
    var item:[String] = ["Helmet","Gloves","Mask"]
    var quantity:[String] = ["2 pcs","3 pcs","1 pcs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    func show() {
        tblvw.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblvw.dataSource = self
        tblvw.delegate = self
        btnofCall.layer.cornerRadius = 10
        btnofCall.layer.borderWidth = 2
        btnofCall.layer.borderColor = UIColor.orange.cgColor
        btnofChat.layer.cornerRadius = 10
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tblvw.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cellData.labelItem.text = item[indexPath.row]
        cellData.labelQuantity.text = quantity[indexPath.row]
        return cellData
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
