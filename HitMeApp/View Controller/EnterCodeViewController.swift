//
//  EnterCodeViewController.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import UIKit

class EnterCodeViewController: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    // Mark:- Variables
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldsUI()
        setUpButtonUI()
        setUpLabelUI()
        setUpImageViewUI()
    }
    

    func setUpTextFieldsUI() {
        
        codeTF.changePlaceholderText(placeholderText: Constants.Text.codePlaceHolder)
        codeTF.customizeTextField(cornerRadius: Constants.CornerRadius.cornerRadius, borderWidth: 1, borderColor: Constants.Design.Color.grey)
        codeTF.with(font: UIFont(name: Constants.Design.Font.ManropeSemiBold, size: Constants.Design.FontSize.phoneNumberScreenTitle)!)
        codeTF.actionForTextfield(button: nextBtn)
        codeTF.addPadding(.both(Constants.Padding.padding))
        
    }
    
    func setUpImageViewUI() {
        backgroundImageView.setImageView(image: Constants.Design.Image.phoneNumberScreenBackgroundImage)
    }
    
    func setUpLabelUI() {
        titleLbl.withManropeBoldFont(text: Constants.Text.codeScreenTitle)
    }
    
    func setUpButtonUI() {
        backBtn.setBackButton()
        nextBtn.setButtonOfNext()
    }
    
    // Mark:- IBActions
    @IBAction func onClickNextBtn(_ sender: Any) {
        if codeTF.text != "" {
            startLoading()
            let verificationId = DefaultsHelper.getVerificationId()
            loginViewModel.loginSignInUserDelegate = self
            CheckUserInDataBase.shared.checkUserDelegate = self
            AddUserInDatabase.shared.addUserDelegate = self
            loginViewModel.signInUserWithPhone(verificationId: verificationId!, code: codeTF.text!)
        }
    }
}
// Mark:- UITextFieldDelegate functions
extension EnterCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

// Mark:- Delegate functions of check user already exist in database, add user in database and handling sign in errors

extension EnterCodeViewController: LoginViewModelSignInUserDelegate, CheckUserDelegate, AddUserDelegate {
    
    func didRecieveSignInErrorResponse(error: Error?, errorMessage: String?) {
        stopLoading()
        SwiftAlert().show( message: errorMessage!, viewController: self)
    }
    func didRecieveCheckUserResponse(Message: String?) {
        stopLoading()
        self.moveToNext("ProfileEditViewController")
    }
    func didRecieveAddUserResponse(Message: String?) {
        stopLoading()
        Utils().pushToProfileViewController(message: Message!, viewController: self)
    }
}
