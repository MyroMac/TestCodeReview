//
//  EnterPhoneNumberViewController.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import UIKit
import PhoneNumberKit


class EnterPhoneNumberViewController: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var phoneNumberTF: PhoneNumberTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    // Mark:- Variables
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTextFieldUI()
    }
    
    func setUpUI() {
        backgroundImageView.setImageView(image: Constants.Design.Image.phoneNumberScreenBackgroundImage)
        headerLbl.withManropeBoldFont(text: Constants.Text.phoneNumberScreenTitle)
        backBtn.setBackButton()
        nextBtn.setButtonOfNext()
    }
    
    func setUpTextFieldUI() {
        phoneNumberTF.changePlaceholderText(placeholderText: Constants.Text.phoneNumberPlaceHolder)
        phoneNumberTF.customizeTextField(cornerRadius: Constants.CornerRadius.cornerRadius, borderWidth: 1, borderColor: Constants.Design.Color.grey)
        phoneNumberTF.with(font: UIFont(name: Constants.Design.Font.ManropeSemiBold, size: Constants.Design.FontSize.phoneNumberScreenTitle)!)
        phoneNumberTF.actionForTextfield(button: nextBtn)
        phoneNumberTF.maxDigits = Constants.maxDigits.phoneNumbermaxDigits
        phoneNumberTF.addPadding(.both(Constants.Padding.padding))
    }
    
    // Mark:- Actions
    @objc func textfieldDidChange(_ viewController: UIViewController) {
         Utils().setButtonAndTextfieldWithorWithoutValue(color: self.phoneNumberTF.text == "" ? Constants.Design.Color.grey : Constants.Design.Color.yellow, textField: self.phoneNumberTF, button: self.nextBtn)
    }
    
    func changeTheColorOfButtonAndTF() {
        
    }
    
    // Mark:- IBActions
    @IBAction func onClickNextBtn(_ sender: Any) {
        if phoneNumberTF.isValidNumber {
            startLoading()
            loginViewModel.loginVerifyPhoneNumberDelegate = self
            let number = phoneNumberTF.nationalNumber
            let phoneNumber = "+1\(number)"
            loginViewModel.verifyPhoneNumber(phoneNumber: phoneNumber)
        } else {
            SwiftAlert().show( message: Constants.AlertMessages.enterValidNumber, viewController: self)
        }
    }
}
// Mark:- UITextFieldDelegate functions
extension EnterPhoneNumberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

//Mark:- Delegate for getting verificationID
extension EnterPhoneNumberViewController: LoginViewModelVerifiyPhoneNumberDelegate {
    func didRecieveVerifyPhoneResponse(verificationId: String?, error: Error?, errorMessage: String?) {
        stopLoading()
        if error != nil {
            SwiftAlert().show( message: errorMessage!, viewController: self)
        } else {
            DefaultsHelper.setVerificationId(verificationId: verificationId!)
            self.moveToNext("EnterCodeViewController")
        }
    }
}
