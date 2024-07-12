//
//  ViewController.swift
//  Practise
//
//  Created by DAPL-Asset-210 on 05/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var labelforchooseCountry: UILabel!
    @IBOutlet weak var tblviewforCountryname: UITableView!
    @IBOutlet weak var labelforchooseYears: UILabel!
    @IBOutlet weak var collectionviewforyears: UICollectionView!
    @IBOutlet weak var btnforSAVE: UIButton!
    
    var countryTable:[String] = ["INDIA","ISRAEL","RUSSIA","JAPAN","BHUTAN"]
    var numbercollection :[String] = ["1-10","11-20","21-40","Older than 41"]
    
    var a: String?
    var b:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails ()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func showDetails () {
        txtfldName.layer.cornerRadius = 10
        txtfldName.layer.borderWidth = 1
        btnforSAVE.layer.cornerRadius = 10
        btnforSAVE.layer.borderWidth = 1
        btnforSAVE.layer.borderColor = UIColor.orange.cgColor
        tblviewforCountryname.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblviewforCountryname.delegate = self
        tblviewforCountryname.dataSource = self
        collectionviewforyears.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionviewforyears.delegate = self
        collectionviewforyears.dataSource = self
    }
    func showingAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btntosave(_ sender: UIButton) {
        if txtfldName.text == "" {
          showingAlert(title: "NAME", message: "Enter Your Name")
        }
        let selectedIndexpathTblvw = tblviewforCountryname.indexPathsForSelectedRows
        if selectedIndexpathTblvw?.count == nil {
              showingAlert(title: "COUNTRY", message: "Choose Your Country")
           }
        let selectedIndexpath = collectionviewforyears.indexPathsForSelectedItems
        if selectedIndexpath?.count == 0 {
           showingAlert(title: "AGE", message: "Choose Your Age")
        }
        else {
            let mnstrbd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mnstrbd.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            nextpage.name = txtfldName.text
            nextpage.tblvwCountry = a
            nextpage.collectionvwYears = b
            self.navigationController?.pushViewController(nextpage, animated: true)
        }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryTable.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = tblviewforCountryname.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cellValue.labelCountryname.text = countryTable[indexPath.row]
        cellValue.layer.borderWidth = 0.5
        cellValue.layer.cornerRadius = 10
        cellValue.layer.borderColor = UIColor.gray.cgColor
        return cellValue
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            a = countryTable[indexPath.row]
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbercollection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = collectionviewforyears.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cellData.labelnumber.text = numbercollection[indexPath.row]
        cellData.layer.cornerRadius = 15
        cellData.layer.borderWidth = 3
        cellData.layer.borderColor = UIColor.gray.cgColor
        return cellData
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let weidthsize = (collectionviewforyears.frame.size.width - 10)/4
        let heightsize = (collectionviewforyears.frame.size.height - 50)
        return CGSize(width: weidthsize, height: heightsize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        b = numbercollection[indexPath.row]
        let cellColor = collectionviewforyears.cellForItem(at: indexPath) as? CollectionViewCell
        cellColor?.layer.borderWidth = 3
        cellColor?.layer.borderColor = UIColor.orange.cgColor
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cellUndo = collectionviewforyears.cellForItem(at: indexPath) as? CollectionViewCell
        cellUndo?.layer.borderWidth = 3
        cellUndo?.layer.borderColor = UIColor.gray.cgColor
    }
}
