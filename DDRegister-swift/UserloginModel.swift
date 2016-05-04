//
//  UserloginModel.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/3.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit
import Alamofire
class UserloginModel: NSObject {

//    "result": "success",
//    "msg": "登录成功",
//    "data": {
//    "user_id": "1",
//    "sex": "1",
//    "nickname": "包心菜",
//    "avatar": "1189CAA552598B845B29B17A427692D1.jpg",
//    "vip": "2",
//    "is_vip_expired": "1",
//    "vip_expire_date": "2015-12-24 00:00:00"
    
    
    var msg : String?
    var data : [String : String]?
    var result : String?
    
    class func login(name : String ,password : String ,completion : (data:UserloginModel?, error:NSError?)->()){
        //        USER_NAME: 用户名
        //        PASSWORD：密码
        
        let parameters : [String : AnyObject] = ["USER_NAME" : name,"PASSWORD" : password]
        let url = "http://www.cloudconfs.com/hottie/index.php/user/login"

        Alamofire.request(.POST, url, parameters: parameters, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (
            response) in
            if response.result.isFailure == true {
                let err = NSError(domain: "网络故障", code: 111, userInfo: nil)
                completion(data: nil ,error: err)
            }
            if let JsonData = response.data {
                let dict : NSDictionary = try! NSJSONSerialization.JSONObjectWithData(JsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                print(dict)


            }
        }
    }
}
