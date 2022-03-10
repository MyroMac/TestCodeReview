//
//  UpdateUserData.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import Firebase
import FirebaseFirestore


protocol UpdateUserDataDelegate {
    func didRecieveUpdateUserDataResponse(Message: String?)
}
//Mark:- Update user info in database
class UpdateUserData {
    static let db = Firestore.firestore()
    static let shared: UpdateUserData = UpdateUserData()
    var updateUserDataDelegate: UpdateUserDataDelegate? = nil
    private init() { }
    
    func updateUserUsers(user: UserModel, profilePicUrl: String) {
        let currentUser = Auth.auth().currentUser!
        let user = UserModel.init( uid: currentUser.uid, phoneNumber: currentUser.phoneNumber ?? "", firstName: user.firstName, userName: user.userName, lastName: user.lastName, profileImageUrl: profilePicUrl, dateCreated: nil)
        UpdateUserData.db.collection(Constants.DatabaseCollections.user).document(currentUser.uid).updateData(user.encode()) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.updateUserDataDelegate?.didRecieveUpdateUserDataResponse(Message: Constants.AlertMessages.profileUpdate)
            }
        }
    }
}
