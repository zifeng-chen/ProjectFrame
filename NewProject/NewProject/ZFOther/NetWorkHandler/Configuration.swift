//
//  Configuration.swift
//  金恪贷
//
//  Created by Kevin on 2017/11/10.
//  Copyright © 2017年 com.jkinest. All rights reserved.
//

import UIKit
import SwiftyJSON

class Configuration{
//    var funckBlock : reloadBlock?
    

    //MARK: 返回父tableview
    class func superTableView(view:UIView) -> UITableView? {
        for view in sequence(first: view.superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
    
    /** swift方法   在 View 中实现这个方法即可
     *viewController () -> (UIViewController) 作用：根据调用这个方法的对象 来 获取他的控制器对象
     */
    class func superViewController(_ view:UIView) -> (UIViewController){
        
        //1.通过响应者链关系，取得此视图的下一个响应者
        var next:UIResponder?
        next = view.next!
        repeat {
            //2.判断响应者对象是否是视图控制器类型
            if ((next as?UIViewController) != nil) {
                return (next as! UIViewController)
                
            }else {
                next = next?.next!
            }
            
        } while next != nil
        
        return UIViewController()
    }

    // MARK: 创建2个自定义色彩,字体,title,带图片的富文本
//    class func creatAttributedStringsWithImage (color:UIColor, font:UIFont, title:String, image:UIImage, bound:CGRect,isFont:Bool, color1:UIColor, font1:UIFont, title1:String) ->  NSMutableAttributedString{
//        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: "\(title)\(title1)")
//        let range: NSRange = NSMakeRange(0, title.count)
//        let range1: NSRange = NSMakeRange(title.count , title1.count)
//        attrString.addAttribute(NSAttributedStringKey.font, value: font, range: range)
//        attrString.addAttribute(NSAttributedStringKey.font, value: font1, range: range1)
//
//        attrString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
//        attrString.addAttribute(NSAttributedStringKey.foregroundColor, value: color1, range: range1)
//
//        // 添加表情
//        let attch: NSTextAttachment = NSTextAttachment()
//        // 表情图片
//        attch.image = image
//        // 设置图片大小
//        attch.bounds = bound
//        // 创建带有图片的富文本
//        let string: NSAttributedString = NSAttributedString(attachment: attch)
//        if isFont {
//            attrString.insert(string, at: 0)
//        } else {
//            attrString.append(string)
//
//        }
//        return attrString
//    }
    
    // MARK: 创建1个自定义色彩,字体,title,带图片的富文本
    class func creatAttributedStringWithImage (color:UIColor, font:UIFont, title:String, image:UIImage, bound:CGRect,isFont:Bool) ->  NSMutableAttributedString{
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: title)
        let range: NSRange = NSMakeRange(0, title.count)
        attrString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        // 添加表情
        let attch: NSTextAttachment = NSTextAttachment()
        // 表情图片
        attch.image = image
        // 设置图片大小
        attch.bounds = bound
        // 创建带有图片的富文本
        let string: NSAttributedString = NSAttributedString(attachment: attch)
        if isFont {
            attrString.insert(string, at: 0)
        } else {
            attrString.append(string)
            
        }
        return attrString
    }
    
    // MARK: 创建2个自定义色彩,字体,title的富文本
    class func creatStringWithColorAndFont (color1:UIColor, font1:UIFont, title1:String, color2:UIColor, font2:UIFont, title2:String) ->  NSMutableAttributedString{
        
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: "\(title1)\(title2)")
        let range1: NSRange = NSMakeRange(0, title1.count)
        let range2: NSRange = NSMakeRange(title1.count, title2.count)
        attrString.addAttribute(NSAttributedString.Key.font, value: font1, range: range1)
        attrString.addAttribute(NSAttributedString.Key.font, value: font2, range: range2)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color1, range: range1)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color2, range: range2)
        //    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithHiraKakuProNW3:12] range:NSMakeRange(4,needText.length-4)];
        return attrString
       
    }
    
    // mark: 根据string返回宽度
    class func widthOfString( string:String, constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil, lines: Int)-> CGFloat{

        let size : CGSize = string.boundingRect(with: constrainedSize, font: font, lines: lines)
        return size.width
    }

    // MARK: 手机号加**
    class func phoneNo(phone:String)->String{
        let string = NSString(string:phone)  //
        
        return string.replacingCharacters(in: NSMakeRange(3, 5), with: "*****")
    }
    
    
    // MARK: 创建4个自定义色彩,字体,title的富文本
    class func creatStringWithFourColorAndFont (color1:UIColor, font1:UIFont, title1:String, color2:UIColor, font2:UIFont, title2:String,color3:UIColor, font3:UIFont, title3:String,color4:UIColor, font4:UIFont, title4:String) ->  NSMutableAttributedString{

        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: "\(title1)\(title2)\(title3)\(title4)")
        let range1: NSRange = NSMakeRange(0, title1.count)
        let range2: NSRange = NSMakeRange(title1.count , title2.count)
        let range3: NSRange = NSMakeRange(title2.count + title1.count, title3.count)
        let range4: NSRange = NSMakeRange(title3.count +  title2.count + title1.count, title4.count)

//        print(attrString, range1, title1 ,range2, title2 ,range3, title3 ,range4, title4)

        attrString.addAttribute(NSAttributedString.Key.font, value: font1, range: range1)
        attrString.addAttribute(NSAttributedString.Key.font, value: font2, range: range2)
        attrString.addAttribute(NSAttributedString.Key.font, value: font3, range: range3)
        attrString.addAttribute(NSAttributedString.Key.font, value: font4, range: range4)

        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color1, range: range1)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color2, range: range2)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color3, range: range3)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: color4, range: range4)

        //    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithHiraKakuProNW3:12] range:NSMakeRange(4,needText.length-4)];
        return attrString

        
    }
    
    // MARK: 创建自定义button
    class func creatCustomButton(title:String, backGroundColor: UIColor, tintColor:UIColor, isBorder:Bool, iscornerRadius:Bool, view:UIView)->UIButton{
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.tintColor = backGroundColor
        button.backgroundColor = backGroundColor
        if iscornerRadius {
            button.layer.cornerRadius = 3
        }
        if isBorder {
            button.layer.borderWidth = 0.5
            button.layer.borderColor = tintColor.cgColor
        }
        view.addSubview(button)
        return button
        
    }
    
    // MARK: 创建自定义label
    class func creatCustomLabel(title:String, backGroundColor: UIColor, titleColor:UIColor, isBorder:Bool, iscornerRadius:Bool, font:UIFont, view:UIView, textAlignment:NSTextAlignment)->UILabel{
        let label = UILabel()
        label.text = title
        label.textColor = titleColor
        label.backgroundColor = backGroundColor
        label.font = font
        label.textAlignment = textAlignment
        if iscornerRadius {
            label.layer.cornerRadius = 3
        }
        if isBorder {
            label.layer.borderWidth = 0.5
            label.layer.borderColor = titleColor.cgColor
        }
        view.addSubview(label)
        return label
        
    }
    
    // 创建自定义textField
    class func creatCustomTextField(placeholder:String, backGroundColor: UIColor, titleColor:UIColor, isBorder:Bool, iscornerRadius:Bool, font:UIFont, view:UIView, textAlignment:NSTextAlignment)->UITextField{
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = titleColor
        textField.backgroundColor = backGroundColor
        textField.font = font
        textField.textAlignment = textAlignment
        if iscornerRadius {
            textField.layer.cornerRadius = 3
        }
        if isBorder {
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = titleColor.cgColor
        }
        view.addSubview(textField)
        return textField
        
    }
    
    
    func extFiedlWithFrame(Frame:CGRect, fontSize:CGFloat, fontColor:UIColor, textAlignment:NSTextAlignment, bgColor:UIColor, clearButtonMode:UITextField.ViewMode, returnKeyType:UIReturnKeyType, keyboardType:UIKeyboardType, placeholder:String) -> UITextField {
       
        let txtfield: UITextField = UITextField(frame: Frame)
        txtfield.backgroundColor = bgColor
        
        txtfield.textAlignment = textAlignment
        txtfield.font = UIFont.systemFont(ofSize: fontSize)
        txtfield.textColor = fontColor
        txtfield.clearButtonMode = clearButtonMode
        txtfield.returnKeyType = returnKeyType
        txtfield.keyboardType = keyboardType
        txtfield.placeholder = placeholder
        return txtfield
    
    }
    
    
    
//    class func shareToThirdPart(viewController:UIViewController) -> Void {
//        //创建分享消息对象
//
//        UMSocialSwiftInterface.setPreDefinePlatforms([
//            (UMSocialPlatformType.wechatSession.rawValue),
//            (UMSocialPlatformType.wechatTimeLine.rawValue),
//            (UMSocialPlatformType.QQ.rawValue),
//            (UMSocialPlatformType.qzone.rawValue)
//            ])
//
//        UMSocialUIManager.removeAllCustomPlatformWithoutFilted()
//        UMSocialShareUIConfig.shareInstance().sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType.bottom
//        UMSocialShareUIConfig.shareInstance().sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType.none
//
//        UMSocialSwiftInterface.showShareMenuViewInWindowWithPlatformSelectionBlock { (platformType, userInfo) in
//            self.runShareWithType(type: platformType,viewController: viewController)
//        }
//    }
    
//    class func runShareWithType(type:UMSocialPlatformType,viewController:UIViewController) -> Void {
//        print("runShareWithType-----\(type)")
//
//        let messageObject = UMSocialMessageObject.init()
//        messageObject.text = "jkinvestloantest"
//        UMSocialSwiftInterface.share(plattype: type, messageObject: messageObject, viewController: viewController) { (data, error) in
//            if (error != nil) {
//
//            }else{
//
//            }
//        }
//
//
//
//    }
    
    // MARK: 保存数据
    class func saveToLocal(string:String, key:String){
        UserDefaults.standard.set(string, forKey: key)
        
    }
    
    // MARK: 读取数据
    class func readFromLocal( key:String) -> Any{
        return UserDefaults.standard.object(forKey: key) ?? String.self
        
    }
    
    // MARK: 啥也没有
//     class func addNothingView(view:UIView){
//
//        let nothingLabel = Configuration.creatCustomLabel(title: "暂无数据", backGroundColor: ClearColor, titleColor: GrayColor, isBorder: false, iscornerRadius: false, font: UIFont.systemFont(ofSize: 16), view: view, textAlignment: .center)
//        nothingLabel.frame = CGRect(x: 0, y: kScreenHeight/2 - 60, width: kScreenWidth, height: 40)
//
//    }
    
    // MARK: 自动登录
//    class func autoLogin(controller: UIViewController) {
//        if AppLock.hasPassword {
//            AppLock.verify(controller: controller, success: { controller in
//
//                Configuration.UserLoginAction(controller: controller)
//                //                print("验证成功")
//            }, forget: { controller in
//                //                print("忘记密码")
//                controller.dismiss(animated: true, completion: nil)
//                controller.hidesBottomBarWhenPushed = true
//                controller.navigationController?.navigationBar.shadowImage = UIImage()
//                controller.navigationController?.pushViewController(LoginController(), animated: true)
//                controller.hidesBottomBarWhenPushed = false
//
//
//            }, overrunTimes: { controller in
//                print("次数超限")
//            })
//        }else{
//            let loginVC = LoginController()
//            controller.hidesBottomBarWhenPushed = true
//            controller.navigationController?.navigationBar.shadowImage = UIImage()
//            controller.navigationController?.pushViewController(loginVC, animated: true)
//            controller.hidesBottomBarWhenPushed = false
//        }
//    }
    
//    // MARK: 自动登录
//    class func UserLoginAction(controller:UIViewController) {
//        PopViewHandler.singleton().showLoadingView()
//        let request = BaseRequest()
//        request.password = Configuration.readFromLocal(key:"password") as? String
//        request.mobile = Configuration.readFromLocal(key:"phone") as? String
//
//        NetWorkHander.sharedInstance.postRequest(urlString: Login, params: request, success: { (success) in
//
//            PopViewHandler.singleton().hideLoadingView()
//
//            let json = JSON(success)
//            let code = json["code"].string
//
//            if (code == "0000") {
//                ShareDataHandler.Singleton.isLogin = true
//                ShareDataHandler.Singleton.token = json["data"]["token"].string
//                ShareDataHandler.Singleton.userId = json["data"]["userInfo"]["userId"].int
//                ShareDataHandler.Singleton.mobile = json["data"]["userInfo"]["mobile"].string
//                Configuration.saveToLocal(string: request.mobile!, key: "phone")
//                Configuration.saveToLocal(string: request.password!, key: "password")
//                Configuration.saveToLocal(string: strOne, key: "LoginState")
//                NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: loginSuccessed)))
//                Configuration.unmessageCheckAction()
////                self.reloadData()
//            } else {
//                let hint = json["msg"].string
//                UIApplication.shared.keyWindow?.makeToast(hint, duration: 3.0, title: nil)
//            }
//
//        }, failture: { (error) in
//
//            PopViewHandler.singleton().hideLoadingView()
//            UIApplication.shared.keyWindow?.makeToast("网络请求失败", duration: 3.0, title: nil)
//        })
//
//
//
//    }
    
    // MARK: 消息检测
//    class func unmessageCheckAction() {
//        let request = BaseRequest()
//        request.userId = ShareDataHandler.Singleton.userId
//        NetWorkHander.sharedInstance.postRequest(urlString: CheckUnReadMessageCount, params: request, success: { (success) in
//            let json = JSON(success)
//            if json["code"].string == successed{
//                if json["data"]["unreadCount"].int! > 0{
//                    ShareDataHandler.Singleton.haveUnreadMes = true
//                }else{
//                    ShareDataHandler.Singleton.haveUnreadMes = false
//
//                }
//            }
//
//        }) { (err) in
//
//        }
//
//    }
    
    
}


extension String {
    // MARK: 限制宽高，可设置行间距，计算准确
    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil) -> CGSize {
        let attritube = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: attritube.length)
        attritube.addAttributes([NSAttributedString.Key.font: font], range: range)
        if lineSpacing != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing!
            attritube.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        }
        
        let rect = attritube.boundingRect(with: constrainedSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        var size = rect.size
        
        if let currentLineSpacing = lineSpacing {
            // 文本的高度减去字体高度小于等于行间距，判断为当前只有1行
            let spacing = size.height - font.lineHeight
            if spacing <= currentLineSpacing && spacing > 0 {
                size = CGSize(width: size.width, height: font.lineHeight)
            }
        }
        
        return size
    }
    
    // MARK: 多了限制行数功能
    /*
     参数解释
     constrainedSize：限制的size
     font:字号
     lineSpacing：默认为nil，使用系统默认的行间距
     lines：限制的行数
     */
    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil, lines: Int) -> CGSize {
        if lines < 0 {
            return .zero
        }
        
        let size = boundingRect(with: constrainedSize, font: font, lineSpacing: lineSpacing)
        if lines == 0 {
            return size
        }
        
        let currentLineSpacing = (lineSpacing == nil) ? (font.lineHeight - font.pointSize) : lineSpacing!
        let maximumHeight = font.lineHeight*CGFloat(lines) + currentLineSpacing*CGFloat(lines - 1)
        if size.height >= maximumHeight {
            return CGSize(width: size.width, height: maximumHeight)
        }
        
        return size
    }
}


