//
//  SwiftAlert.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

public class SwiftAlert {
    
    var okAction : (()->())?
    
    public func show(message : String, viewController : UIViewController, okAction : (()->())? = nil) {
        
        let alert:UIAlertController = UIAlertController(title: Constants.AppInfo.appName, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
            
            if let _okAction = okAction {
                
                _okAction()
            }
        }))
        viewController.present(alert, animated:true, completion:nil);
        
    }
}
