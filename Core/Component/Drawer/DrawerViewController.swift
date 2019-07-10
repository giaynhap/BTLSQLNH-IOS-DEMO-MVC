//
//  DrawerBiewController.swift
//  QLNhaHangApp
//
//  Created by Imac on 7/10/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import Foundation

class DrawerViewController: BaseView<DrawerController> {
    
    
    override func viewDidLoad() {
        controller = DrawerController();
        super.viewDidLoad();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
     
    }
    
    
}
