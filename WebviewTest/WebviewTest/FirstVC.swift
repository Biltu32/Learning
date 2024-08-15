//
//  ViewController.swift
//  WebviewTest
//
//  Created by DAPL-Asset-210 on 12/08/24.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var btnAjio: UIButton!
    @IBOutlet weak var btnAmazon: UIButton!
    @IBOutlet weak var btnFlipkart: UIButton!
    @IBOutlet weak var btnMyntra: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup ()
    }
    
    func initialSetup () {
        buttonSetup(myButton: btnAjio)
        buttonSetup(myButton: btnAmazon)
        buttonSetup(myButton: btnFlipkart)
        buttonSetup(myButton: btnMyntra)
    }
    
    func buttonSetup(myButton: UIButton) {
        myButton.layer.cornerRadius = 5
        myButton.layer.borderWidth = 1
        myButton.layer.borderColor = UIColor.systemPink.cgColor
    }

    @IBAction func btnAjiowebsite(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextPage = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        nextPage.comingString = "https://www.ajio.com"
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @IBAction func btnAmazonwebsite(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextPage = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        nextPage.comingString = "https://www.amazon.in"
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @IBAction func btnFlipkartwebsite(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextPage = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        nextPage.comingString = "https://www.flipkart.com"
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @IBAction func btnMyntrawebsite(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextPage = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        nextPage.comingString = "https://www.myntra.com"
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
}

