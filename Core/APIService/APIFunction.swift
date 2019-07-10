//
//  APIFunction.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/18/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension APIRequestProvider{
    func login(_ account:String,_ password:String) -> DataRequest {
        let urlString = requestURL.appending("/API/Authorize")
        
        var param = [String: String]()
        param["account"] = account
        param["password"] = password
        
        
       return  self.alamoFireManager.request(urlString,
                                      method: .post,
                                      parameters: param,
                                      encoding: JSONEncoding.default,
                                      headers: nil)
    }
    
    func checkToken(_ token:String) -> DataRequest {
        
        let urlString = requestURL.appending("/API/CheckToken");
        var param = [String: String]();
        param["accessToken"] = token;
       
        var urlComponent = URLComponents(string: urlString)!
        let queryItems = param.map  { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems;

        return  self.alamoFireManager.request(urlComponent,
                                              method: .post,
                                              parameters: param,
                                              encoding: JSONEncoding.default,
                                              headers: nil)
    }
}
