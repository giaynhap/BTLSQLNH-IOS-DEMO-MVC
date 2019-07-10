//
//  AlterUtils.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/19/19.
//  Copyright © 2019 Imac. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController {
    
     func showInfoAlert(_ message:String){
         showAlter("Info",message);
    }
     func showErrorAlert(_ message:String){
        showAlter("Error",message);
    }
    
    
    func showAlter(_ title:String,_ message:String, _ button:String = "Đồng ý"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil);
        alert.addAction(UIAlertAction(title: button , style: .default, handler: nil));
    }
    
    
}
