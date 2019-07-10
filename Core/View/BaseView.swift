//
//  BaseView.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/6/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import UIKit

class BaseView<T>: UIViewController {
	
    var viewModel:String = "default";
    var controller:T?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (controller as! BaseController).loaded(self);
        
    }
    convenience init(name:String)
    {
        self.init(nibName: name,bundle:nil);
        self.viewModel = name;
    }
}
extension BaseView{
    func createView(_ nibName:String) ->UIViewController
    {
        return  BaseView(name:nibName);
    }
}


