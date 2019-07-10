//
//  LoginViewController.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/19/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import UIKit

 class DashboardViewController: BaseView<DashboardController> {

 
    override func viewDidLoad() {
        controller = DashboardController();
        super.viewDidLoad();
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    

}
