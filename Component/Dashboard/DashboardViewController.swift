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
        var drawerView =  DrawerViewController(name: "Drawer");
        self.addDrawer(drawerView);
        super.viewDidLoad();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    

    @IBAction func onPress(_ sender: Any) {
           self.drawer!.toggle();
    }
}
