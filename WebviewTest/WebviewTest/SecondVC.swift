//
//  SecondVC.swift
//  WebviewTest
//
//  Created by DAPL-Asset-210 on 12/08/24.
//

import UIKit
import WebKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var comingString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "\(comingString)")!))
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
