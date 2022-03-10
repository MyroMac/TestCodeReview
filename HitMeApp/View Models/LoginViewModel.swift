//
//  LoginViewModel.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import FirebaseAuth
import Firebase

protocol LoginViewModelVerifiyPhoneNumberDelegate {
    func didRecieveVerifyPhoneResponse(verificationId: String?, error: Error?, errorMessage: String?)
}
protocol LoginViewModelSignInUserDelegate {
    func didRecieveSignInErrorResponse(error: Error?, errorMessage: String?)
}

struct LoginViewModel {
    var loginVerifyPhoneNumberDelegate: LoginViewModelVerifiyPhoneNumberDelegate? = nil
    var loginSignInUserDelegate: LoginViewModelSignInUserDelegate? = nil
    
    // Mark:- Verify phone number in firebase authentication
    func verifyPhoneNumber(phoneNumber: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if error != nil {
                loginVerifyPhoneNumberDelegate?.didRecieveVerifyPhoneResponse(verificationId: nil, error: error, errorMessage: error?.localizedDescription)
            } else {
                loginVerifyPhoneNumberDelegate?.didRecieveVerifyPhoneResponse(verificationId: verificationID!, error: nil, errorMessage: nil)
            }
        }
    }
    
    // Mark:- Sign in user with verification id and code
    func signInUserWithPhone(verificationId: String, code: String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil {
                loginSignInUserDelegate?.didRecieveSignInErrorResponse(error: error, errorMessage: error?.localizedDescription)
            } else {
                checkUserInDatabase(user: authResult?.user)
            }
        }
    }
    // Mark:- Checking user in database
    func checkUserInDatabase(user : User?) {
        guard let user = user else { return }
        let userDetail = UserModel.init(uid: user.uid, phoneNumber: user.phoneNumber ?? "", firstName: "", userName: "", lastName: "", profileImageUrl: "", dateCreated: Date().dateToString(fomrat: Constants.DateFormat.format))
        CheckUserInDataBase.shared.checkUser(user: userDetail)
        
    }
}

