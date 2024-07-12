//
//  UserTabBarController.swift
//  TabViewController
//
//  Created by DAPL-Asset-210 on 10/04/24.
//

import UIKit

class UserTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTabviewController()
    }
    
  func showTabviewController(){
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = ProfileViewController()
        let vc4 = BookmarkViewController()
        let vc5 = DeleteViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "person")
        vc4.tabBarItem.image = UIImage(systemName: "bookmark")
        vc5.tabBarItem.image = UIImage(systemName: "trash")
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Profile"
        vc4.title = "Bookmark"
        vc5.title = "Delete"
        
        let navc1 = UINavigationController(rootViewController: vc1)
        let navc2 = UINavigationController(rootViewController: vc2)
        let navc3 = UINavigationController(rootViewController: vc3)
        let navc4 = UINavigationController(rootViewController: vc4)
        let navc5 = UINavigationController(rootViewController: vc5)
        
        setViewControllers([navc1,navc2,navc3,navc4,navc5], animated: true)
    }
    
    
}
