//
//  ThirdViewController.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import UIKit

class ThirdViewController : UIViewController {
    
    @IBOutlet weak var txtfldforID: UITextField!
    @IBOutlet weak var tblvwforComment: UITableView!
    var responsePostDetails : [GetResponseComments] = []
    var baseURL = "https://jsonplaceholder.typicode.com/posts/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        txtfldforID.becomeFirstResponder()
    }
    
    func getAPIcalling (baseUrl:String) {
     API_Manager.sharedInstance.getComments(baseURL: baseUrl) { result, status, message in
     guard let response = result else {return}
     self.responsePostDetails = response
     DispatchQueue.main.async {
                 self.tableviewShow()
                 self.tblvwforComment.reloadData()
            }
        }
    }
    func tableviewShow() {
        tblvwforComment.register(UINib(nibName: "CommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblvwforComment.delegate = self
        tblvwforComment.dataSource = self
    }
    
    func showingAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnforCheckdetails(_ sender: UIButton) {
        if Int(txtfldforID.text ?? "") ?? 0 > 100 {
            showingAlert(title: "ALERT", message: "Please enter valid ID")
        }
        else {
            getAPIcalling(baseUrl:baseURL + (txtfldforID.text ?? "") + "/comments")
        }
        txtfldforID.text = ""
    }
}

extension ThirdViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return responsePostDetails.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tblvwforComment.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentsTableViewCell
        let show = responsePostDetails[indexPath.row]
        cellData.labelUserID.text = "UserID: " + String(show.postID)
        cellData.labelID.text = "ID: " + String(show.id)
        cellData.labelName.text = "Name: " + show.name
        cellData.labelEmail.text = "Email: " + show.email
        cellData.labelBody.text = "Body: " + show.body
        return cellData
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
