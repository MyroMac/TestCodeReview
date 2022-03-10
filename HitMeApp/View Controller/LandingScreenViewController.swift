//
//  ViewController.swift
//  HitMeApp
//
//  Created by Michael Robert Macatangay on 2/28/22.
//

import UIKit

class LandingScreenViewController: UIViewController {

    // Mark:- Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var header1Lbl: UILabel!
    @IBOutlet weak var header2Lbl: UILabel!
    @IBOutlet weak var joinSquadLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var instagramBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var faceBookBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpButtonUI()
    }
    
    func setUpUI() {
        header1Lbl.with(text: Constants.Text.landingScreenTitle, font: UIFont(name: Constants.Design.Font.ManropeBold, size: Constants.Design.FontSize.BigTitle)!)
        header2Lbl.with(text: Constants.Text.landingScreenSubtitle)
        joinSquadLbl.with(text: Constants.Text.joinSquad)
        backgroundImageView.setImageView(image: Constants.Design.Image.landingScreenBackgroundImage)
        
    }
    
    func setUpButtonUI() {
        loginBtn.setButtonText(Constants.Text.SignIn)
        loginBtn.setButtonLayer(Constants.CornerRadius.cornerRadius, borderColor: Constants.Design.Color.yellow, borderWidth: 1)
        faceBookBtn.setButtonImage(Constants.Design.Image.facebook)
        twitterBtn.setButtonImage(Constants.Design.Image.twitter)
        instagramBtn.setButtonImage(Constants.Design.Image.instagram)
        phoneBtn.setButtonImage(Constants.Design.Image.phone)
    }
    
     //Mark:- IBActions
    @IBAction func onClickLoginBtn(_ sender: Any) {
        self.moveToNext("EnterPhoneNumberViewController")
    }
    
    @IBAction func onClickSocialLoginBtn(_ sender: Any) {
        self.showUnderDevelopmentAlert()
    }
    
    @IBAction func onClickPhoneBtn(_ sender: Any) {
        self.moveToNext("EnterPhoneNumberViewController")
      
    }
    func showUnderDevelopmentAlert() {
        SwiftAlert().show( message: Constants.AlertMessages.UnderDevelopement, viewController: self) {}
    }
}

