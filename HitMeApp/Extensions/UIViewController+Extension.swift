//
//  UIViewController+Extension.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    @IBAction func onClickBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func startLoading(){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.contentColor = UIColor.white
        hud.bezelView.color = UIColor.gray
        hud.bezelView.style = .solidColor
        hud.bezelView.layer.cornerRadius = 10.0
    }
    func stopLoading(){
        MBProgressHUD.hide(for: self.view, animated: true)
        
    }
    func moveToNext(storyBoard: StoryBoardType = .main,_ identifier: String, titleVal: String = "") {
        let controller = storyBoard.storyboard.instantiateViewController(withIdentifier: identifier)
        controller.title = titleVal
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
