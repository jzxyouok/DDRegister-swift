//
//  LoginViewViewController.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/3.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import WechatKit


class LoginViewViewController: UIViewController{

    /** 背景图 */
    @IBOutlet weak var BGImageView: UIImageView!
    /** 头像 */
    @IBOutlet weak var HeadImageVIew: UIImageView!
    /** 输入框 */
    @IBOutlet weak var loginView: UIView!
    /** 电话输入框 */
    @IBOutlet weak var phoneTextField: UITextField!
    /** 密码输入框 */
    @IBOutlet weak var passwordTextField: UITextField!
    /** 忘记密码按钮 */
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    /** 注册按钮 */
    @IBOutlet weak var registerBtn: UIButton!
    /** 登陆按钮 */
    @IBOutlet weak var loginBtn: UIButton!
    /** 微信登陆按钮 */
    @IBOutlet weak var wechatLoginBtn: UIButton!
    /** qq登陆按钮 */
    @IBOutlet weak var QQLoginBtn: UIButton!
    /** OR前面的分割线 */
    @IBOutlet weak var firstOrView: UIView!
    /** OR后面的分割线 */
    @IBOutlet weak var lastOrView: UIView!
    /** 手机分割线 */
    @IBOutlet weak var phoneVIew: UIView!
    /** 密码分割线 */
    @IBOutlet weak var passwordView: UIView!
    /** orLabel */
    @IBOutlet weak var OrLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /** 界面设置封装到frame类中 */
        let DDframe = loginViewFrame()
        DDframe.parentController = self
        DDframe.setFrame()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    /** 登陆 */
    @IBAction func loginBtnAction(sender: UIButton) {
        print(phoneTextField.text)
        print(passwordTextField.text)
        if phoneTextField.text == "" || passwordTextField.text == "" {
        
            print("请输入账号或密码")
            return
        }
        
        UserloginModel.login(phoneTextField.text!, password: passwordTextField.text!) { (data, error) in
            print(data)
        }
    }

    /** 微信第三方登陆 */
    @IBAction func loginWeChat(sender: UIButton) {
        WechatManager.sharedInstance.checkAuth { result in
            switch result {
            case .Failure(let errCode)://登录失败
                print(errCode)
            case .Success(let value)://登录成功 value为([String: String]) 微信返回的openid access_token 以及 refresh_token
                //print(value)
                print(value["openid"]!)
                WechatLogin.wechatLogin(String(value["openid"]!), completion: { (data, error) in
                    if data!.msg == "success"{
                        print("successsssss")
                        self.presentViewController(ViewController(), animated: true, completion: nil)
                    }
                    
                })
            }
        }
 
    }

    /** 微信注册 */
    @IBAction func testWechatRegister(sender: UIButton) {
//        WEIXIN: 微信账号,
//        AVATAR: 头像,
//        NICKNAME: 昵称,
//        BUST: 胸围,
//        WAIST: 腰围,
//        HIP: 臀围,
//        CITY: 地区,
//        BIRTHDAY: 生日,
//        SEX: 性别
        WechatManager.sharedInstance.getUserInfo { result in
            switch result {
            case .Failure(let errCode)://获取失败
                print(errCode)
            case .Success(let value)://获取成功 value为([String: String]) 微信用户基本信息
                print(value)
            }
        }
        
        
        let dict  = ["WEIXIN":"billding211","AVATAR":"http://wx.qlogo.cn/mmopen/ZlRHK7ekj0BiaWKHtibFCQJkZm6NibF5DJ5T9J17R3AFfMrM9k67qkaSYvwSzZVG4m4uNmJjicy632Uw28fyoxXAqYibrWQKdbCJ3/0","NICKNAME":"dingding","BUST":"1","WAIST":"1","HIP":"1","CITY":"1","BIRTHDAY":"1","SEX":"1"]
        
        Alamofire.request(.POST, "http://www.cloudconfs.com/hottie/index.php/user/weixin_user_register", parameters: dict, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            print("微信注册信息 \(response)")
        }
        
    }
    
    let qqLogin : QQLogin = QQLogin()
    /** qq登陆 */
    @IBAction func QQLoginAction(sender: UIButton) {
        qqLogin.sendQQAuthRequest()
        
    }
    
  
}






