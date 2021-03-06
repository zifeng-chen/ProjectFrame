//
//  NetWorkHander.swift
//  金恪贷
//
//  Created by Kevin on 2017/11/20.
//  Copyright © 2017年 com.jkinest. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//import ObjectMapper

//typealias requestHandle = (Any) -> Void
private let NetworkRequestShareInstance = NetWorkHander()

class NetWorkHander{
    class var sharedInstance : NetWorkHander {
        return NetworkRequestShareInstance
    }
    
}


extension NetWorkHander {
    //MARK: - GET 请求
    //    let tools : NetworkRequest.shareInstance!
    
    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        //使用Alamofire进行网络请求时，调用该方法的参数都是通过getRequest(urlString， params, success :, failture :）传入的，而success传入的其实是一个接受           [String : AnyObject]类型 返回void类型的函数
        
        let url = String("\(APIAdress)\(urlString)")
        print(params, url)
        
//        Alamofire.request(url, method: .get, parameters: params.toJSON(),encoding: JSONEncoding.default).responseJSON { (response) in
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //                    if let value = response.result.value as? [String: AnyObject] {
                    success(value as! [String : AnyObject])
                    //                    }
//                    success(response.result)
//                    let json = JSON(value)
//                    print(json)
                    
                case .failure(let error):
                    failture(error)
//                    print("error:\(error)")
                }
        }
        
    }
    
    func getRequests(urlString: String, params : BaseRequest, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {

        let url = String("\(APIAdress)\(urlString)")
        print(params.toJSON(), url)
        let headers = [
            "Content-Type":"application/x-www-form-urlencoded; charset=utf-8",
            ]
        request(url, method: .get, parameters: params.toJSON(), encoding: URLEncoding.default, headers: headers).responseJSON { response in
            //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
            //使用switch判断请求是否成功，也就是response的result
            switch response.result {
            case .success(let value):
                success(value as! [String : AnyObject])
            case .failure(let error):
                failture(error)
            }
        }
        
    }
    
    //MARK: - POST 请求
    func postWithHeaderRequest(urlString : String, params : BaseRequest, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        let url = String("\(APIAdress)\(urlString)")
        params.token = ShareDataHandler.Singleton.token
        print(params.toJSON())
        print("--- 测试地址:\(url)")
        let headers = [
            "Content-Type":"application/x-www-form-urlencoded; charset=utf-8",
            ]
        Alamofire.request(url, method : HTTPMethod.post , parameters : params.toJSON(), encoding: URLEncoding.default ,  headers: headers).responseJSON { response in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }

        }
        
//        Alamofire.request(url, method: HTTPMethod.post, parameters: params.toJSON()).responseJSON { (response) in
//            switch response.result{
//            case .success:
//                if let value = response.result.value as? [String: AnyObject] {
//                    success(value)
//                    let json = JSON(value)
//                    print(json)
//                }
//            case .failure(let error):
//                failture(error)
//                print("error:\(error)")
//            }
//
//        }
    }
    
    
    //MARK: - POST 请求
    func postRequest(urlString : String, params : BaseRequest, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        let url = String("\(APIAdress)\(urlString)")

        print(params.toJSON())
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: params.toJSON()).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
        }
        
    }
    
    func postRequests(urlString : String, params : BaseRequest, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        let url = String("\(APIAdress)\(urlString)")
        
        print(params.toJSON())
        Alamofire.request(url, method: HTTPMethod.post, parameters: params.toJSON(),encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    _ = JSON(value)
//                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
        }
    }
   
    
    //MARK: - 照片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:
//    func upLoadImageRequest(urlString : String, params:[String:String]?, data: [Data], name: [String]?,success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
//
//        let headers = ["content-type":"multipart/form-data"]
//        let url = String("\(APIAdress)\(urlString)")
//
//        Alamofire.upload(
//            multipartFormData: { multipartFormData in
//                //666多张图片上传
////                let flag = params["flag"]
////                let userId = params["userId"]
////
////                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
////                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
//
//                for i in 0..<data.count {
//                    multipartFormData.append(data[i], withName: "file", fileName: "file\(i).png", mimeType: "image/png")
////                    let imageName = String(NSDate()) + ".png"
//
//                    //multipartFormData.appendBodyPart(data: ,name: ,fileName: ,mimeType: )这里把图片转为二进制,作为第一个参数
//                }
//
//
//
//        },
//            to: url,
//            headers: headers,
//            encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        print(JSON(response.result.value as Any))
//
//                        if let value = response.result.value as? [String: AnyObject]{
//                            success(value)
//                            let json = JSON(value)
//                            print(json)
//                        }
//                    }
//                case .failure(let encodingError):
//                    print(encodingError)
//                    failture(encodingError)
//                }
//        }
//        )
//    }
    
    
    /// 2.11照片信息上传
    func bm_upload_photo_info(urlString : String, params:BaseRequest?, data: [Data], name: [String],
                                     success:@escaping (_ response:[String:AnyObject]) -> (), failure:@escaping(_ error: Error) -> ()){
        NetWorkHander.sharedInstance.upLoadImageRequest(urlString: String("\(APIAdress)\(urlString)"),params:params?.toJSON(), data: data, name: name, success: { (response) in
            success(response)
        }, failture: { (error) in
            failure(error)
        })
    }
    
    //MARK: - 照片上传的封装
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId       为上传的参数
    ///        flag - 666 信息上传多张   －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:、
    
    func upLoadImageRequest(urlString : String, params:[String: Any]?, data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        //header的上传
        let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            if params?.count != 0{
            //666多张图片上传
                let flag = params!["flag"]
                let userId = params!["userId"]
            
            //参数的上传
                multipartFormData.append(((flag as AnyObject).data(using: String.Encoding.utf8.rawValue)!), withName: "flag")
                multipartFormData.append( ((userId as AnyObject).data(using: String.Encoding.utf8.rawValue)!), withName: "userId")
            }
            //multipartFormData.append(<#T##data: Data##Data#>, withName: <#T##String#>, fileName: <#T##String#>, mimeType: <#T##String#>)  ---使用的方法
            //遍历图片，挨个添加，withName-name和后台确定是什么
            for i in 0..<data.count {
                multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
            }
        },
                         to: urlString,
                         headers: headers,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    if let value = response.result.value as? [String: AnyObject]{
                                        success(value)
                                    }
                                }
                            case .failure(let encodingError):
                                failture(encodingError)
                            }
        }
        )
    }
    
    
}
