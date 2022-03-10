//
//  CheckUsernameAvailable.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol CheckUserNameDelegate {
    func didRecieveCheckUsernameResponse(bool: Bool)
}
// Mark:- Check username is available or not
class CheckUsernameAvailable {
    static let db = Firestore.firestore()
    static let shared: CheckUsernameAvailable = CheckUsernameAvailable()
    var checkUsernameDelegate: CheckUserNameDelegate? = nil
    private init() { }
    
    func checkUsername(username: String) {
        CheckUsernameAvailable.db.collection(Constants.DatabaseCollections.user).whereField("username", isEqualTo: username).getDocuments(completion: { document, error in
            if let doc = document, doc.documents.count > 0 {
                self.checkUsernameDelegate?.didRecieveCheckUsernameResponse(bool: false)
            } else {
                self.checkUsernameDelegate?.didRecieveCheckUsernameResponse(bool: true)
            }
        })
    }
}
