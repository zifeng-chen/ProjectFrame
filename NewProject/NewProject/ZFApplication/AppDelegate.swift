//
//  AppDelegate.swift
//  NewProject
//
//  Created by CHEN-ZIFENG on 2018/11/5.
//  Copyright © 2018 陈_子疯. All rights reserved.
//

import UIKit
import CYLTabBarController
import EFNavigationBar
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // tabbar中间圆点
//        CYLPlusButtonSubclassing.register()
        
        
        // tabbar
        let mainTabBarVc = MainTabBarViewController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
        
        self.window = UIWindow()
        self.window?.frame  = UIScreen.main.bounds
        self.window?.rootViewController = mainTabBarVc
        self.window?.makeKeyAndVisible()
        
        //tabbar背景色
        UITabBar.appearance().backgroundColor = UIColor.white
        //tabbar字体颜色
        UITabBar.appearance().tintColor = UIColor(red: 235/255, green: 91/255, blue: 69/255, alpha: 1)
        
        
        // 键盘管理
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.shouldToolbarUsesTextFieldTintColor = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        return true
    }

    func viewControllers() -> [UINavigationController]{
        let home = UINavigationController(rootViewController: HomeViewController())
        let user = UINavigationController(rootViewController: UserViewController())
    
        let viewControllers = [home,user]
        
        return viewControllers
        
    }
    
    func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let HomeTabBarItem = [CYLTabBarItemTitle:"首页",
                              CYLTabBarItemImage:"home_normal",
                              CYLTabBarItemSelectedImage:"home_highlight"]
        
        let UserTabBarItem = [CYLTabBarItemTitle:"我的",
                               CYLTabBarItemImage:"me_normal",
                               CYLTabBarItemSelectedImage:"me_highlight"]
        
        let tabBarItemsAttributes = [HomeTabBarItem,UserTabBarItem]
        return tabBarItemsAttributes
    }
    
    // MARK: - 全局导航栏
    func setNavBarAppearence()
    {
        // 设置导航栏默认的背景颜色
        EFNavigationBar.defaultNavBarBarTintColor = MainColor
        // 设置导航栏所有按钮的默认颜色
        EFNavigationBar.defaultNavBarTintColor = .black
        // 设置导航栏标题默认颜色
        EFNavigationBar.defaultNavBarTitleColor = .white
        // 统一设置状态栏样式
        EFNavigationBar.defaultStatusBarStyle = .default
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        EFNavigationBar.defaultShadowImageHidden = true
        //        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
}

