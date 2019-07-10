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
    var drawerView:UIViewController?;
    var drawer:DrawerController?;
    override func viewDidLoad() {
        super.viewDidLoad()
        if (( controller) != nil)
        {
            (controller as! BaseController).loaded(self);
        }
        
    }
    convenience init(name:String)
    {
        self.init(nibName: name,bundle:nil);
        self.viewModel = name;
    }
    
    func addDrawer(_ drawerView:UIViewController){
     
        if ( self.drawerView != nil )
        {
            self.drawerView?.removeFromParent();
        }
        drawerView.view.translatesAutoresizingMaskIntoConstraints = false;
        let window = UIApplication.shared.keyWindow!
 
        NSLayoutConstraint(item: drawerView.view, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: drawerView.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: window.frame.height ).isActive = true

        //shadow
        drawerView.view.layer.shadowColor = UIColor.black.cgColor
        drawerView.view.layer.shadowOpacity = 0.5
        drawerView.view.layer.shadowOffset = .zero
        drawerView.view.layer.shadowRadius = 5
        
       
        self.view.addSubview(drawerView.view);
        drawerView.view.transform = CGAffineTransform.identity.translatedBy(x:-200, y: 0)
        self.drawerView = drawerView;
        
        drawer = DrawerController();
        drawer?.loaded(self.drawerView!);
     
        
    }
}
extension BaseView{
    func createView(_ nibName:String) ->UIViewController
    {
        return  BaseView(name:nibName);
    }
}


