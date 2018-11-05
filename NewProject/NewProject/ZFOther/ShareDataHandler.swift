//
//  ShareDataHandler.swift
//  金恪贷
//
//  Created by Kevin on 2017/11/10.
//  Copyright © 2017年 com.jkinest. All rights reserved.
//

import UIKit

final class ShareDataHandler: NSObject {
    static let Singleton = ShareDataHandler()
    private override init() {
//        print("ShareDataHandler 初始化了一次")
    }

    var isLogin:Bool! = false
    var a_account:Int!
    var token:String!
    var phone_num:String!
    var username:String!
    var password:String!
    var haveUnreadMes:Bool! = false
}
