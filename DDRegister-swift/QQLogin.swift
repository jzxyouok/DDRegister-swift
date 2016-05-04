//
//  QQLogin.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/4.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit
import Alamofire
class QQLogin: NSObject, TencentLoginDelegate ,TencentSessionDelegate {
    
//    {
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
//    }
//    }
    
    // MARK:QQ登陆
    //http://www.cloudconfs.com/hottie/index.php/user/qq_user_login
    
    var _tencentOAuth:TencentOAuth!
    

    //第一步  QQ登录
    func sendQQAuthRequest(){
        //let appid = "1105049929"
        let appid = "222222"
        /** 初始化对象 */
        _tencentOAuth = TencentOAuth(appId:appid , andDelegate: self)
        /** 配置请求授权列表 */
        let permissions = [kOPEN_PERMISSION_GET_INFO,kOPEN_PERMISSION_GET_USER_INFO,kOPEN_PERMISSION_GET_SIMPLE_USER_INFO]
        /** 发送请求 */
        _tencentOAuth.authorize(permissions)
        
    }
    //第二步 登录成功回调
    func tencentDidLogin() {
        if !_tencentOAuth.accessToken.isEmpty {
            print("----------------------------------------")
            print("登录成功！")
//            print("openId：\(_tencentOAuth.openId)",
//                  "accessToken：\(_tencentOAuth.accessToken)",
//                  "expirationDate：\(_tencentOAuth.expirationDate)")
//            print("开始获取用户资料")
            //_tencentOAuth.getUserInfo()
            loginByQQ()
        }else {
            print("登录失败！没有获取到accessToken")
        }
    }
    
    //失败
    func tencentDidNotLogin(cancelled: Bool) {
        if cancelled {
            print("用户取消登录!")
        }else{
            print("登录失败!")
        }
    }
    
    //无网络
    func tencentDidNotNetWork() {
        print("没有网络")
    }
    
    
    //第四步 在获取用户回调中获取用户信息
    func getUserInfoResponse(response: APIResponse!) {

        /** 获取用户回调信息字典 */
        //let dic:Dictionary = response.jsonResponse
        
        //print("dic:\(dic)")

    }
    
    
    //第五步 QQ登陆
    func loginByQQ(){
        
        let url = "http://www.cloudconfs.com/hottie/index.php/user/qq_user_login"
        //let para = ["OPEN_ID":_tencentOAuth.openId]
        
        //let para = ["OPEN_ID":"5C87A5A1FAD9BBCA8D61E8C35BCACD69"]
        let para = ["OPEN_ID":"220BD1221A3830F864F6845FCA000F0B"]
        Alamofire.request(.POST, url, parameters: para, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (res) in
            
            if res.result.isFailure == true{
                let err = NSError(domain: "网络错误", code: 113, userInfo: nil)
                
                print("err=================\(err)")
            }
            if let jsonData = res.data {
                let dict : NSDictionary = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                print("登陆信息===============\(dict)========")
            }
        }
    }
    
    
    //    要退出登录、取消授权。只需要调用 TencentOAuth 对象的 logout() 方法即可。
    //    1
    //    _tencentOAuth.logout(self)
    

}
