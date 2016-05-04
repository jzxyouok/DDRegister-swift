//
//  WechatLogin.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/3.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit
import Alamofire
class WechatLogin: NSObject {

    var msg : String?
    var data : [String : String]?
    var result : String?
    
    
    class func wechatLogin(openid : String,completion:(data :WechatLogin? , error:NSError?)->()){
        //OPEN_ID
        let url = "http://www.cloudconfs.com/hottie/index.php/user/weixin_user_login"
        let parameters : [String : AnyObject] = ["OPEN_ID":openid]
        
        Alamofire.request(.POST, url, parameters: parameters, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            
            if response.result.isFailure == true {
                let err = NSError(domain: "网络错误", code: 112, userInfo: nil)
                completion(data: nil, error: err)
                print(err)
            }
            if let jsonData = response.data {
                let dict : NSDictionary = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                /** 没有做模型，简单的赋值一下msg */
                let dataRaw = WechatLogin()
                dataRaw.msg = dict["result"] as? String
                if( dataRaw.msg == "success"){
                    completion(data: dataRaw, error: nil)
                }else{
                    let err = NSError(domain: "有错误", code: 111, userInfo: nil);
                    completion(data: dataRaw, error: err)
                }
            }
        }
    }
}
