//
//  CustomAlertLoadingView.swift
//  QLNhaHangApp
//
//  Created by Imac on 4/18/19.
//  Copyright © 2019 Imac. All rights reserved.
//
import UIKit
import Foundation

class CustomAlertLoadingView: UIViewController {
    static let sharedInstance = CustomAlertLoadingView()
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var lastView:UIView? = nil;
    override func viewDidLoad() {
        indicator.startAnimating();
        view?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.view.layer.cornerRadius = 14.0;
        
       
       
        
    }
    private init() {
        super.init(nibName: "loading", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    public func display(_ ui:UIView)
    {
       hide();
     
        ui.addSubview(self.view);
         lastView = ui;
        view?.centerYAnchor.constraint(equalTo: ui.centerYAnchor, constant: 0).isActive = true
        view?.centerXAnchor.constraint(equalTo: ui.centerXAnchor, constant: 0).isActive = true
        view?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.center  = CGPoint(x:ui.frame.width/2,y:ui.frame.height/2);
       
    }
    public func hide(){
        if (lastView==nil){
            return;
        }
        view?.removeFromSuperview()
        lastView = nil;
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}



