//
//  ViewController.swift
//  CollectionView
//
//  Created by DAPL-Asset-210 on 03/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelCountrylist: UILabel!
    @IBOutlet weak var labelEurope: UILabel!
    @IBOutlet weak var labelAfrica: UILabel!
    @IBOutlet weak var collectionviewwithName: UICollectionView!
    @IBOutlet weak var europecollectionview: UICollectionView!
    @IBOutlet weak var africacollectionview: UICollectionView!
    var countryPicAsia:[String] = ["AFGHANISTAN","BANGLADESH","BHUTAN","INDIA","MYANMAR","NEPAL","SRILANKA"]
    var countrynameAsia:[String] = ["AFGHANISTAN","BANGLADESH","BHUTAN","INDIA","MYANMAR","NEPAL","SRILANKA"]
    var countryPicEurope:[String] = ["BELGIUM","FRANCE","GERMANY","NETHERLANDS","PORTUGAL","SPAIN","SWITZERLAND"]
    var countrynameEurope:[String] = ["BELGIUM","FRANCE","GERMANY","NETHERLANDS","PORTUGAL","SPAIN","SWITZERLAND"]
    var countryPicAfrica:[String] = ["BRAZIL","GHANA","KENYA","NIGER","MOROCCO","SOUTH AFRICA","ZIMBABWE"]
    var countrynameAfrica:[String] = ["BRAZIL","GHANA","KENYA","NIGER","MOROCCO","SOUTH AFRICA","ZIMBABWE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup() {
        collectionviewwithName.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionviewwithName.dataSource = self
        collectionviewwithName.delegate = self
        europecollectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        europecollectionview.dataSource = self
        europecollectionview.delegate = self
        africacollectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        africacollectionview.dataSource = self
        africacollectionview.delegate = self
    }
}


extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countrynameAsia.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = collectionviewwithName.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        if collectionView == collectionviewwithName {
            cellData.imageview.image = UIImage(named: countryPicAsia[indexPath.row])
            cellData.labelName.text = countrynameAsia[indexPath.row]
            return cellData
        }
        else if collectionView == europecollectionview  {
            cellData.imageview.image = UIImage(named: countryPicEurope[indexPath.row])
            cellData.labelName.text = countrynameEurope[indexPath.row]
            return cellData
        }
        else {
            cellData.imageview.image = UIImage(named: countryPicAfrica[indexPath.row])
            cellData.labelName.text = countrynameAfrica[indexPath.row]
            return cellData
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthsize = (collectionviewwithName.frame.size.width-10)/3
        let heightsize = (collectionviewwithName.frame.size.height-10)
        return CGSize(width: widthsize, height: heightsize)
    }
}
