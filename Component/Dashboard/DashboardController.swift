//
//  LoginController.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/6/19.
//  Copyright © 2019 Imac. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DashboardController: BaseController,BaseControllerProtocol {
    var viewController:DashboardViewController? = nil;
    
    
    override func loaded(_ view:Any) {
        self.viewController = view as! DashboardViewController;
        
    }
    
    
}
