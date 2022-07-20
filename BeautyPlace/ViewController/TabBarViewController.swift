//
//  TabBarViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 7.06.22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startVC = StartListViewController()
        let magnifuingVC = MagnifuingViewController()
        let mapVC = MapViewController()
        let recordsVC = RecordsViewController()
        let profileVC = ProfileViewController()
        startVC.tabBarItem.image = UIImage(named: "ImageTabBarStart")
        magnifuingVC.tabBarItem.image = UIImage(named: "ImageMagnifuing")
        mapVC.tabBarItem.image = UIImage(named: "ImageTabBarMap")
        recordsVC.tabBarItem.image = UIImage(named: "ImageFavourite")
        profileVC.tabBarItem.image = UIImage(named: "ImageTabBarProfile")
        self.setViewControllers([startVC, magnifuingVC, mapVC, recordsVC, profileVC], animated: false)
    }
}
