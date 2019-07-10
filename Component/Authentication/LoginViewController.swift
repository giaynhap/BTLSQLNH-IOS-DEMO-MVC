//
//  LoginViewController.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/19/19.
//  Copyright © 2019 Imac. All rights reserved.
//

import UIKit

class LoginViewController: BaseView<LoginController> {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
   
    
    override func viewDidLoad() {
        controller = LoginController();
        super.viewDidLoad();
        btnLogin.addTarget(self, action: #selector(LoginViewController.onClickLogin), for:.touchDown  )
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @objc func onClickLogin(){
        
        let account = txtAccount.text!;
        let password = txtPassword.text!;
        if (account==""||password=="")
        {
          self.showErrorAlert("Bạn phải nhập đủ thông tin tài khoản mật khẩu")
            return;
        }
        self.controller!.login(account, password)
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
}
