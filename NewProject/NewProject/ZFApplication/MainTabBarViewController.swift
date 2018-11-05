//
//  MainTabBarViewController.swift
//  NewProject
//
//  Created by CHEN-ZIFENG on 2018/11/5.
//  Copyright © 2018 陈_子疯. All rights reserved.
//

import UIKit
import CYLTabBarController

class MainTabBarViewController: CYLTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

extension MainTabBarViewController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.updateSelectionStatusIfNeeded(for: tabBarController, shouldSelect: viewController)
        return true
    }
}
