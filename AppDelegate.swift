//
//  AppDelegate.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/6/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow();
         self.window?.frame = UIScreen.main.bounds
        
        var view:UIViewController? ;
      
        view = LoginViewController(name: "Login");
        
        
 
        let navigationController = UINavigationController(rootViewController: view!)
        
        
        self.window?.rootViewController = navigationController;
        
        self.window?.makeKeyAndVisible()
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

