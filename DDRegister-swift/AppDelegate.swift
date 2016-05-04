//
//  AppDelegate.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/3.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit
import WechatKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?

//    AppID：wxd0ff9ca58ff23538
//    AppSecret：1bc4bc6533eee2bb4165a570acb977ee

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = LoginViewViewController()
        window?.makeKeyAndVisible()
        
        WechatManager.appid = "wxd0ff9ca58ff23538"
        WechatManager.appSecret = "1bc4bc6533eee2bb4165a570acb977ee"
        print(WechatManager.sharedInstance.isInstalled())

        return true
    }
    
    
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return self.application(application, openURL: url, sourceApplication: nil, annotation: [])

    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return WechatManager.sharedInstance.handleOpenURL(url) || TencentOAuth.HandleOpenURL(url)
        // 如需要使用其他第三方可以 使用 || 连接 其他第三方库的handleOpenURL
        // return WechatManager.sharedInstance.handleOpenURL(url) || TencentOAuth.HandleOpenURL(url) || WeiboSDK.handleOpenURL(url, delegate: SinaWeiboManager.sharedInstance) ......
        
    }
    

    


 

}

