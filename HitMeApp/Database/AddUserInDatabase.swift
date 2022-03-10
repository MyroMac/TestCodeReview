//
//  AddUserInDatabase.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol AddUserDelegate {
    func didRecieveAddUserResponse(Message: String?)
}
// Mark:- Add user in database
class AddUserInDatabase {
    static let db = Firestore.firestore()
    static let shared: AddUserInDatabase = AddUserInDatabase()
    var addUserDelegate: AddUserDelegate? = nil
    private init() { }
    
    func addUsers(user: UserModel) {
        AddUserInDatabase.db.collection(Constants.DatabaseCollections.user).document(user.uid!).setData(user.encode()) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.addUserDelegate?.didRecieveAddUserResponse(Message: Constants.AlertMessages.userSuccessfullyRegister)
            }
        }
    }
}
