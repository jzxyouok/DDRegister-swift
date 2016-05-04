//
//  loginViewFrame.swift
//  DDRegister-swift
//
//  Created by dingding on 16/5/3.
//  Copyright © 2016年 dingding. All rights reserved.
//

import UIKit




class loginViewFrame: NSObject {
    
    let appwidth = UIScreen.mainScreen().bounds.size.width
    let edgeWidth = 40
    let space = 5
    var parentController : LoginViewViewController?
    
    func setFrame(){
        
        parentController!.view.removeConstraints(parentController!.view.constraints)
        parentController!.loginView.removeConstraints(parentController!.loginView.constraints)
        
        parentController!.OrLabel.alpha = 0.6
        parentController!.firstOrView.alpha = 0.6
        parentController!.lastOrView.alpha = 0.6
        
        parentController?.HeadImageVIew.layer.cornerRadius = 30
        
        parentController!.BGImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        parentController!.HeadImageVIew.snp_makeConstraints { (make) in
            make.top.equalTo(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerX.equalTo(parentController!.view.snp_centerX)
            
            
        }
        
        parentController!.loginView.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.HeadImageVIew.snp_bottom).offset(30)
            //make.centerX.equalTo(view.snp_centerX)
            make.left.equalTo(parentController!.view.snp_left).offset(edgeWidth)
            make.right.equalTo(parentController!.view.snp_right).offset(-edgeWidth)
            make.height.equalTo(80)
            
        }
        parentController!.phoneTextField.snp_makeConstraints { (make) in
            make.top.equalTo(space)
            make.left.equalTo(space)
            make.right.equalTo(space)
            make.height.equalTo(space * 5)
        }
        parentController!.phoneVIew.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.phoneTextField.snp_bottom)
            make.height.equalTo(1)
            make.left.equalTo(space)
            make.right.equalTo(space)
        }
        parentController!.passwordTextField.snp_makeConstraints { (make) in
            make.left.equalTo(space)
            make.right.equalTo(space)
            make.top.equalTo(parentController!.phoneVIew.snp_bottom).offset(space * 2)
            make.height.equalTo(space * 5)
            //make.top.equalTo(phoneVIew.snp_bottom).offset(5)
            //make.bottom.equalTo(loginView.snp_bottom).offset(1)
        }
        parentController!.passwordView.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.passwordTextField.snp_bottom)
            make.left.right.equalTo(space)
            make.height.equalTo(1)
        }
        
        parentController!.forgetPasswordBtn.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.loginView.snp_bottom).offset(space)
            make.left.equalTo(edgeWidth )
        
            make.size.equalTo(CGSize(width: 100,height: 30))
        }
        
        parentController!.registerBtn.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.loginView.snp_bottom).offset(space)
            make.right.equalTo(-edgeWidth )
            make.size.equalTo(CGSize(width: 100,height: 30))
        }
        
        parentController!.loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.registerBtn.snp_bottom).offset(space)
            make.centerX.equalTo(parentController!.view.snp_centerX)
            make.height.equalTo(40)
            make.left.equalTo(edgeWidth + 2 * space)
            make.right.equalTo(-edgeWidth - 2 * space)
        }
        
        parentController!.firstOrView.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.loginBtn.snp_bottom).offset(60)
            make.height.equalTo(1)
            make.left.equalTo(CGFloat(edgeWidth) * 1.5 )
            make.width.equalTo((appwidth - CGFloat(edgeWidth * 3) - 50) / 2)
        }
        
        parentController!.OrLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(parentController!.firstOrView.snp_centerY)
            make.left.equalTo(parentController!.firstOrView.snp_right).offset(10)
            make.width.equalTo(30)
        }
        
        parentController!.lastOrView.snp_makeConstraints { (make) in
            make.centerY.equalTo(parentController!.firstOrView.snp_centerY)
            make.left.equalTo(parentController!.OrLabel.snp_right).offset(10)
            //make.width.equalTo(firstOrView.snp_width)
            make.size.equalTo(parentController!.firstOrView.snp_size)
        }
        
        parentController!.wechatLoginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(parentController!.firstOrView.snp_bottom).offset(20)
            make.left.equalTo(edgeWidth * 2)
            make.size.equalTo(CGSizeMake(60, 60))
        }
        parentController!.QQLoginBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(parentController!.wechatLoginBtn.snp_centerY)
            make.right.equalTo(-edgeWidth * 2)
            make.size.equalTo(CGSizeMake(60, 60))
        }
        
        
        
    }

        

    

}
