//
//  TabViewController.swift
//  ONE
//
//  Created by APPLE on 11/04/24.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    private var arrTitle = ["Home", "Favourites", "Profile"]
    
    private var arrIcon = [UIImage(named: "home_blank"),UIImage(named: "blankStar"),UIImage(named: "userProfileBlank")]
    
    private var arrSelectedIcon = [UIImage(named: "home_fill"),UIImage(named: "star_fill"),UIImage(named: "userProfile")]
    
    //MARK: - ViewLifeCycle -
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.UpdatedTabs()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.UpdatedTabs), name: Notification.Name("UpdateTab"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc public func UpdatedTabs(){
        
        DispatchQueue.main.async {
            
            //Set Home Tab
            let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let HomeVC = homeStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            HomeVC.tabBarItem.title = self.arrTitle[0]
            HomeVC.tabBarItem.image = self.arrIcon[0]?.withRenderingMode(.alwaysOriginal)
            HomeVC.tabBarItem.selectedImage = self.arrSelectedIcon[0]?.withRenderingMode(.alwaysOriginal)
            let HomeVCNavigation = UINavigationController(rootViewController: HomeVC)
            HomeVCNavigation.navigationBar.isHidden = false
            
            //Set Favourites Tab
            let favStoryBoard: UIStoryboard = UIStoryboard(name: "Favourites", bundle: nil)
            let favVC = favStoryBoard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
            favVC.tabBarItem.title = self.arrTitle[1]
            favVC.tabBarItem.image = self.arrIcon[1]?.withRenderingMode(.alwaysOriginal)
            favVC.tabBarItem.selectedImage = self.arrSelectedIcon[1]?.withRenderingMode(.alwaysOriginal)
            let favVCNavigation = UINavigationController(rootViewController: favVC)
            favVCNavigation.navigationBar.isHidden = false
            
            //Set Profile Tab
            let profileStoryBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
            let profileVC = profileStoryBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            profileVC.tabBarItem.title = self.arrTitle[2]
            profileVC.tabBarItem.image = self.arrIcon[2]?.withRenderingMode(.alwaysOriginal)
            profileVC.tabBarItem.selectedImage = self.arrSelectedIcon[2]?.withRenderingMode(.alwaysOriginal)
            let profileVCNavigation = UINavigationController(rootViewController: profileVC)
            profileVCNavigation.navigationBar.isHidden = false
            
            //Add VCs as tabBar Item
            self.viewControllers = [HomeVCNavigation, favVCNavigation, profileVCNavigation]
            self.selectedIndex = 0
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item::", item.title ?? "")
        if item.title == "Home" {
//            if UIApplication.getTopViewController().isKind(of: HomeVC.self) {
                NotificationCenter.default.post(name: Notification.Name("UpdateHomeScreen"), object: nil)
//            }
        }
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller::", viewController)
    }

    // Override selectedViewController for User initiated changes
    override var selectedViewController: UIViewController? {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }
    // Override selectedIndex for Programmatic changes
    override var selectedIndex: Int {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }

    // handle new selection
    private func tabChangedTo(selectedIndex: Int) {
        if selectedIndex == 0 || selectedIndex == 2 {
            (self.viewControllers?[selectedIndex] as? UINavigationController)?.popToRootViewController(animated: true)
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}
class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.2
    
    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart
        
        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }
    
    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
