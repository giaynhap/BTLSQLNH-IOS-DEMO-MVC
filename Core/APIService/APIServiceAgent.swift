//
//  APIServiceAgent.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/19/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
let responseCodeSuccess = 0
let errorCodeNoData     = 404

let statusCodeSuccess = "SUCCESS"
let statusCodeFail = "FAIL"


class APIServiceAgent: NSObject {
    
    static var shared:APIServiceAgent? = APIServiceAgent();
    func startRequest(_ request: DataRequest, completion: @escaping(JSON, NSError?) -> Void) {
        
        request
            .validate()
            .responseJSON { (_ response: DataResponse<Any>) in
               
                print("----------------\nrequest: \(request)\n\n\(response)");
                switch response.result {
                case .success:
        
                    let json = JSON(response.result.value!);
                    let error  = json["error"].int!;
                    if (error == 1 )
                    {
                        completion(JSON.null, NSError(domain: (json["message"].string!), code: error, userInfo: nil ));
                        return;
                    }
                      completion(json, nil);
                    break;
                case .failure:
                    completion(JSON.null, NSError(domain: response.error!.localizedDescription, code: 1, userInfo: nil ) );
                    break;
                }
        }
        
    }
}
