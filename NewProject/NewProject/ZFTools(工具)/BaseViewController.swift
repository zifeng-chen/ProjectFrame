//
//  BaseViewController.swift
//  WRNavigationBar_swift
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar_swift

import UIKit
import EFNavigationBar

class BaseViewController: UIViewController
{
    lazy var navBar = EFCustomNavigationBar.CustomNavigationBar()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
        
    }

    fileprivate func setupNavBar()
    {
        
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景图片
//        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")
//        navBar.backgroundColor = MainColor

        // 设置自定义导航栏背景颜色
//         navBar.backgroundColor = MainColor
        navBar.barBackgroundColor = MainColor
        // 设置自定义导航栏标题颜色
//        navBar.titleLabelColor = .white
        
        // 设置自定义导航栏左右按钮字体颜色
        navBar.ef_setTintColor(color: .white)
        
        
        
        if self.navigationController?.children.count != 1 {
//            navBar.wr_setLeftButton(title: "<<", titleColor: UIColor.white)
            navBar.ef_setLeftButton(image: #imageLiteral(resourceName: "back"))
        }
    }
    
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
    }
}
