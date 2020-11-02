//
//  ViewController.swift
//  F Integration iOS
//
//  Created by Md Khaled Hasan Manna on 2/11/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController,LoginButtonDelegate {
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        if let token = AccessToken.current,
            !token.isExpired {
            
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                     parameters: ["fields":"email,name"],
                                                     tokenString: token,
                                                     version: nil,
                                                     httpMethod: .get)
            request.start { (connection, result, error) in
            
                print("\(String(describing: result))")
            }
            
            
            
        }else{
            let loginButton = FBLoginButton()
                          loginButton.center = view.center
                          loginButton.delegate = self
                          loginButton.permissions = ["public_profile", "email"]
                          view.addSubview(loginButton)
                   
        }
        
          
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields":"email,name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start { (connection, result, error) in

            print("\(String(describing: result))")
            
        }
       
        
    }
    
  func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    
    }

}

