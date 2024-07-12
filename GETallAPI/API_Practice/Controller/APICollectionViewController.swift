//
//  APICollectionViewController.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 15/02/24.
//

import UIKit

class APICollectionViewController :UIViewController {
    
    @IBOutlet weak var collectionviewAPI : UICollectionView!
    var collection : [CollectionViewData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 collectionviewAPI.register(UINib(nibName: "APICollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        getAPICollection ()
    }
    
    func getAPICollection () {
        API_Manager.sharedInstance.getCollection { result, status, message in
            guard let response = result else { return }
            self.collection = response
            DispatchQueue.main.async {
                self.collectionviewAPI.delegate = self
                self.collectionviewAPI.dataSource = self
                self.collectionviewAPI.reloadData()
            }
        }
    }
    
   
}

extension APICollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellValue = collectionviewAPI.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! APICollectionViewCell
        let source = collection[indexPath.row]
        cellValue.labelID.text = "ID: " + String(source.id)
        cellValue.labelTitle.text = "Title: " + source.title
        return cellValue
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthsize = (collectionviewAPI.frame.size.width - 10)/2
        let heightsize = collectionviewAPI.frame.size.height - 450
        return CGSize(width: widthsize, height: heightsize)
    }
}
