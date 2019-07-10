//
//  GButton.swift
//  QLNhaHangApp
//
//  Created by Imac on 6/17/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation
import UIKit

class GButton:UIButton
{
    open override func draw(_ rect: CGRect) {
 
        
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = true
        
    }
}
