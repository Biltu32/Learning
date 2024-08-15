//
//  Notification screen.swift
//  MachineTest
//
//  Created by DAPL-Asset-210 on 07/08/24.
//

import UIKit

struct NotificationDetails {
    var profileImage : UIImage
    var notificationTitle : String
    var notificationdate : String
}

class NotificationScreen: UIViewController {
    
    @IBOutlet weak var notificationTableview : UITableView!
    @IBOutlet weak var greetingLabel : UILabel!

    var allNotificationDetails : [NotificationDetails] = []
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        greetingLabel.text = "Welcome " + (username ?? "AA") + " !"
        allNotificationDetails = [
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March"),
            NotificationDetails(profileImage: UIImage(named: "Profile")!, notificationTitle: "Notification Title", notificationdate: "21 March")
        ]
        
        notificationTableview.register(UINib(nibName: "NotificationData", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        notificationTableview.delegate = self
        notificationTableview.dataSource = self
        
    }
    
   
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


extension NotificationScreen : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotificationDetails.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = notificationTableview.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationData
        cellValue.profileImageView.image = allNotificationDetails[indexPath.row].profileImage
        cellValue.notificationLabel.text = allNotificationDetails[indexPath.row].notificationTitle
        cellValue.dateLabel.text = allNotificationDetails[indexPath.row].notificationdate
        return cellValue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
}
