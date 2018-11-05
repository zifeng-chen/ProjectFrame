//
//  SwiftHeader.swift
//  Bilianshe
//
//  Created by 陈_子疯 on 2018/7/17.
//  Copyright © 2018年 Xion_Chen. All rights reserved.
//

import UIKit
import SwiftyJSON
import SnapKit
import SwiftyUserDefaults

let UIKeyWindow = UIApplication.shared.keyWindow

let NAVBAR_COLORCHANGE_POINT:CGFloat = IMAGE_HEIGHT - CGFloat(kNavBarBottom * 2)
let IMAGE_HEIGHT:CGFloat = 260
let SCROLL_DOWN_LIMIT:CGFloat = 100
let LIMIT_OFFSET_Y:CGFloat = -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)
let kNavBarBottom = WRNavigationBar.navBarBottom()

let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth = UIScreen.main.bounds.width
let isDeviceSE = (kScreenHeight == 568.0 ? true : false)
let isDevice8 = (kScreenHeight == 667.0 ? true : false)
let isDevice8P = (kScreenHeight == 736.0 ? true : false)
let isDeviceX = (kScreenHeight == 812.0 ? true : false)

let naviHeightX = 88
let naviHeight = 64

let zero = 0

var selectIndex = Int()

let MainColor = UIColor(red: 254/255, green: 77/255, blue: 57/255, alpha: 1)
let LineColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
let DropColor = UIColor(red: 13/255, green: 164/255, blue: 1/255, alpha: 1)
let RiseColor = UIColor(red: 30/255, green: 191/255, blue: 97/255, alpha: 1)
let DeclineColor = UIColor(red: 241/255, green: 73/255, blue: 81/255, alpha: 1)

let strNull = ""

/// 点击排序时触发
var ActionBool:Bool = false

let systemVersion = UIDevice.current.systemVersion

let APIAdress = "https://www.mzkj88.com/"

let Login = "mobile/vcode_logins"
let Code = "user/verify/v_code"
let Home = "mobile/u/stock-news"
let News = "mobile/news/news_content/"
let Weibo = "mobile/news/weibo/20/"
let Message = "mobile/u/message-center"
let Advise = "user/usrAdvise"
let Headline = "mobile/news/news/20/"
let Newsflash = "mobile/stock/kuaixun"
let Letter = "mobile/s/stock-report"
let Optional = "mobile/showSelectedStock"
let ScreenTag = "mobile/stock_condition"
let ScreenData = "mobile/stock_selection/"
