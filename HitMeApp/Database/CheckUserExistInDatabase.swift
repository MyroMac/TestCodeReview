//
//  CheckUserExistInDatabase.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol CheckUserDelegate {
    func didRecieveCheckUserResponse(Message: String?)
}

protocol GetUserDeleagte {
    func didRecieveGetUserResponse(error: Error?, errorMessage: String?, user: [String: Any]?)
}
// Makr:- Check user alrady exist in database
class CheckUserInDataBase {
    static let db = Firestore.firestore()
    static let shared: CheckUserInDataBase = CheckUserInDataBase()
    var checkUserDelegate: CheckUserDelegate? = nil
    var getUserDelegate: GetUserDeleagte? = nil
    private init() { }
    
    func checkUser(user: UserModel) {
        CheckUserInDataBase.db.collection(Constants.DatabaseCollections.user).document(user.uid!).getDocument(completion: { document, error in
            if let doc = document , doc.exists {
                self.checkUserDelegate?.didRecieveCheckUserResponse(Message: Constants.AlertMessages.userSuccessfullyLogin)
            } else {
                AddUserInDatabase.shared.addUsers(user: user)
            }
        })
    }
    
    func getUserData() {
        let user_id = (Auth.auth().currentUser?.uid)!
        CheckUserInDataBase.db.collection(Constants.DatabaseCollections.user).document(user_id).getDocument { snap, error in
            if error != nil {
                self.getUserDelegate?.didRecieveGetUserResponse(error: error, errorMessage: error?.localizedDescription, user: nil)
            } else{
                self.passDataToCheckNil(snap: snap)
            }
        }
    }
    
    func passDataToCheckNil(snap: DocumentSnapshot?) {
        if let doc = snap , doc.exists {
            let data = doc.data()
            self.getUserDelegate?.didRecieveGetUserResponse(error: nil, errorMessage: nil, user: data)
        }
    }
}
