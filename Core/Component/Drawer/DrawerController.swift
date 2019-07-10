//
//  DrawerController.swift
//  QLNhaHangApp
//
//  Created by Imac on 7/10/19.
//  Copyright © 2019 Imac. All rights reserved.
//



import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DrawerController: BaseController,BaseControllerProtocol {
    var viewController:DrawerViewController? = nil;
    
    
    override func loaded(_ view:Any) {
        self.viewController = view as? DrawerViewController;
        
        self.viewController?.view.isHidden = true;
        
    }
    
    func toggle(){
        if (self.viewController?.view.isHidden == true)
        {
            self.viewController?.view.isHidden = false;
            UIView.animateKeyframes(withDuration:0.5, delay: 0, options: .allowUserInteraction    , animations: {
                self.viewController?.view.center.x +=  (self.viewController?.view.frame.width)!;
                
            }, completion: nil)
        }
        else{
            UIView.animateKeyframes(withDuration:0.3, delay: 0, options: .allowUserInteraction    , animations: {
                self.viewController?.view.center.x -=  (self.viewController?.view.frame.width)!;
                
            }) { (completed) in
                
                self.viewController?.view.isHidden = true;
            }
        }
    }
    
}
