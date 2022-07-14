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
        let calendarVC = MapViewController()
        let recordsVC = RecordsViewController()
        let profileVC = ProfileViewController()
        startVC.tabBarItem.image = UIImage(named: "ImageTabBarStart")
        magnifuingVC.tabBarItem.image = UIImage(named: "ImageMagnifuing")
        calendarVC.tabBarItem.image = UIImage(named: "ImageTabBarCalendar")
        recordsVC.tabBarItem.image = UIImage(named: "ImageTabBarRecords")
        profileVC.tabBarItem.image = UIImage(named: "ImageTabBarProfile")
        self.setViewControllers([startVC, magnifuingVC, calendarVC, recordsVC, profileVC], animated: false)
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class RecordsViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .green
    }
}
class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
}
 
