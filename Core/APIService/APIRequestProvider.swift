//
//  APIRequestProvider.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/6/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

let kClientVersionHeaderField = "CLIENT-VERSION"
let kClientOSHeaderField = "CLIENT-OS"
let kAppVersionBuild = "version"

let baseURL = "http://svn.3asoft.vn:6102/";
let apiVersion = "";
class APIRequestProvider: NSObject {
    
 
    static var shareInstance: APIRequestProvider? = APIRequestProvider()
    
    class func clearCookie() {
        let cstorage = HTTPCookieStorage.shared
        if let cookies = cstorage.cookies {
            for cookie in cookies {
                cstorage.deleteCookie(cookie)
            }
        }
    }
    class func reset() {
        let cstorage = HTTPCookieStorage.shared
        if let cookies = cstorage.cookies {
            for cookie in cookies {
                cstorage.deleteCookie(cookie)
            }
        }
        shareInstance = nil
        shareInstance = APIRequestProvider()
    }
    
    private var _headers: HTTPHeaders = [:]
    private var _headerWithUserPosition: HTTPHeaders = [:]
    
    var headers: HTTPHeaders {
        set {
            _headers = headers
        }
        get {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
            let deviceOS = "ios"
            var headers: HTTPHeaders = [:]
            
            headers = [
                "Accept": "application/json",
                "Content-Type": "application/json",
                kClientVersionHeaderField: version,
                kClientOSHeaderField: deviceOS
         
            ]
            return headers
        }
    }
    private var _requestURL: String = baseURL
 	   var requestURL: String {
        set {
            _requestURL = requestURL
        }
        get {
            return _requestURL
        }
    }
    
    
    var alamoFireManager: SessionManager!
                                           
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 60
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        
        if let domain = URL(string: baseURL)?.domain() {
            let serverTrustPolicies: [String: ServerTrustPolicy] = [
                domain: .disableEvaluation
            ]
            alamoFireManager = Alamofire.SessionManager(
                configuration: configuration,
                serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
            )
        
        } else {
            alamoFireManager = Alamofire.SessionManager(configuration: configuration)
        }
        
    }
}
extension  URL{
    func domain()->String?{
        if let hostName = self.host  {
            let subStrings = hostName.components(separatedBy: ".")
            var domainName = ""
            let count = subStrings.count
            if count > 2 {
                domainName = subStrings[count - 2] + "." + subStrings[count - 1]
            } else if count == 2 {
                domainName = hostName
            }
            return domainName;
        }
        return nil;
    }
}
