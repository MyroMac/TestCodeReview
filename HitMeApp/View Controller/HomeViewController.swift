//
//  HomeViewController.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        view.setViewBackgroundColor(Constants.Design.Color.yellow)
        logoutBtn.setButtonText(Constants.Text.logout)
        logoutBtn.setButtonBackgroundColor(Constants.Design.Color.white)
        logoutBtn.setButtonLayer(Constants.CornerRadius.cornerRadius, borderColor: .clear, borderWidth: 0)
        
    }
    
    //Mark:- IBAction
    @IBAction func onClickLogoutBtn(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: LandingScreenViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        } catch {}
    }
}
