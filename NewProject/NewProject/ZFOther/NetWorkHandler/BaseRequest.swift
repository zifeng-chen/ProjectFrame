//
//  BaseRequest.swift
//  金恪贷
//
//  Created by Kevin on 2017/11/20.
//  Copyright © 2017年 com.jkinest. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseRequest: Mappable {
    var category:String?
    
    var phone_num:String?
    var v_code:String?
    var data = [String:String]()
    var type:String?
    var phone_number:String?
    var user_name:String?
    var content:String?
    
    var cityId:String?
    var mobile:String?
    var verifiKey:String?       //验证码key
    var verifiCode:String?      //验证码
    var password:String?        //密码
    var newPass:String?         //新密码
    var confirmPass:String?     //确认密码
    var userId:Int?             // 用户ID
    var page:Int?               // 页数
    var rows:Int?               // 每页条数
    var relconName:String?      // 亲属紧急联系人姓名
    var relconNumber:String?    //亲属紧急联系人电话
    var relconType: String?     // 亲属联系人类型
    var soaconName: String?     // 社交联系人姓名
    var soaconNumber: String?   // 社交联系人电话
    var soaconType: String?     // 社交联系人类型

    var token:String?
    var phonePass : String? // 手机服务密码
    
    
    var username: String?
    var age: Int?
    var weight: Double!
    var request: BaseRequest?        // User对象
    var friends: [BaseRequest]?         // Users数组
    var birthday: Date?
    var array: [AnyObject]?
    
//    var data: [String:String]?
//    var dictionary: [String : AnyObject] = [:]
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        relconName      <- map["relconName"]
        relconNumber    <- map["relconNumber"]
        relconType      <- map["relconType"]
        soaconName      <- map["soaconName"]
        soaconNumber    <- map["soaconNumber"]
        soaconType      <- map["soaconType"]
        phonePass       <- map["phonePass"]
        page            <- map["page"]
        rows            <- map["rows"]
        token           <- map["token"]
        userId          <- map["userId"]
        confirmPass     <- map["confirmPass"]
        newPass         <- map["newPass"]
        category        <- map["category"]
        verifiKey       <- map["verifiKey"]
        verifiCode      <- map["verifiCode"]
        password        <- map["password"]
        mobile          <- map["mobile"]
        cityId          <- map["cityId"]
        username        <- map["username"]
        age             <- map["age"]
        weight          <- map["weight"]
        request         <- map["request"]
        friends         <- map["friends"]
        birthday        <- (map["birthday"], DateTransform())
        array           <- map["arr"]
        data           <- map["data"]
        
        
        phone_num       <- map["phone_num"]
        v_code          <- map["v_code"]
        data            <- map["data"]
        type            <- map["type"]
        phone_number    <- map["phone_number"]
        user_name       <- map["user_name"]
        content         <- map["content"]
//        dictionary      <- map["dict"]
    }
}
    

