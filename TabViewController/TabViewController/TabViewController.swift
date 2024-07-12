//
//  TabViewController.swift
//  TabViewController
//
//  Created by DAPL-Asset-210 on 09/04/24.
//

import UIKit

class TabViewController: UITabBarController {

//    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabViewController()
    }
    
            func tabViewController() {
                let tabBar = UITabBarController()
                let firstVC = UIViewController()
                firstVC.view.backgroundColor = .white
                let secondVC = UIViewController()
                secondVC.view.backgroundColor = .yellow
                let thirdVC = UIViewController()
                thirdVC.view.backgroundColor = .gray
                let forthVC = FourthViewController()
                forthVC.view.backgroundColor = .orange
                let item1 = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
                let item2 = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
                let item3 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
                let item4 = UITabBarItem(tabBarSystemItem: .history, tag: 3)
                firstVC.tabBarItem = item1
                secondVC.tabBarItem = item2
                thirdVC.tabBarItem = item3
                forthVC.tabBarItem = item4
                tabBar.setViewControllers([firstVC,secondVC,thirdVC,forthVC], animated: true)
                self.view.addSubview(tabBar.view)
            }
            
            
}
