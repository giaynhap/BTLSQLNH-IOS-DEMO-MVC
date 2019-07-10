//
//  AppDataManage.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/19/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation

struct defaultsKeys {
    static let saveToken = "loginToken"
 
}

class AppDataManage: NSObject {
    static var token:String?;
    static var userRole:Role?;
    static var share:AppDataManage = AppDataManage();
    
    func saveToken(_ token:String)
    {
        
        let defaults = UserDefaults.standard;
        defaults.set(token,forKey:defaultsKeys.saveToken)
    }
    
    func getSaveToken()-> String? {
        let defaults = UserDefaults.standard;
        if let token = defaults.string(forKey: defaultsKeys.saveToken) {
            return token;
        }
        return nil;
    }
    
}

enum Role  {
    
    case admin
    case customer

    static let allValues = [admin,customer]

}


