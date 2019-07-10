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

 class LoginController: BaseController,BaseControllerProtocol {
    var viewController:LoginViewController? = nil;
    
    
    override func loaded(_ view:Any) {
        self.viewController = view as! LoginViewController;
        
        
        
        if let token = AppDataManage.share.getSaveToken() {
             CustomAlertLoadingView.sharedInstance.display(viewController!.view)
            
            
            let dataRequest = APIRequestProvider.shareInstance?.checkToken(token);
            
            APIServiceAgent.shared?.startRequest(dataRequest!) {
                (_ json: JSON, _ error: NSError? ) in
                  CustomAlertLoadingView.sharedInstance.hide();
                if (error != nil || json==JSON.null || json["error"]==1 )
                {
                    
                    return;
                }
               
               /// self.reponseAuthentication(json, error)
                
            }
            
            
        }
        
    }
      func login(_ account:String,_ password:String)
    {
        
        CustomAlertLoadingView.sharedInstance.display(viewController!.view)
        var data:DataRequest = APIRequestProvider.shareInstance!.login(account, password);
        APIServiceAgent.shared?.startRequest(data, completion: self.reponseAuthentication )
    }
    
    func reponseAuthentication (_ json: JSON, _ error: NSError? ){
        if (error != nil)
        {
            CustomAlertLoadingView.sharedInstance.hide();
            self.viewController?.showErrorAlert("Đăng Nhập thất bại \n"+(error?.domain)!);
            return;
        }
        
        AppDataManage.token = json["data"]["token"].string!;
        AppDataManage.userRole = .admin;
        
        CustomAlertLoadingView.sharedInstance.hide();
        let view = DashboardViewController(name: "Dashboard");
        self.viewController?.navigationController?.present(view, animated: true){
            () in
            AppDataManage.share.saveToken(AppDataManage.token!);
        }
    }
    
}
