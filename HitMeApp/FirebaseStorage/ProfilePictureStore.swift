//
//  ProfilePictureStore.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

protocol ProfilePicStoreDelegate {
    func didRecieveProfilePicStoreResponse(Message: String?)
}

class ProfilePicStore {
    static let shared: ProfilePicStore = ProfilePicStore()
    var profilePicStoreDelegate: ProfilePicStoreDelegate? = nil
    private init() { }
    
    func storeProfilePic(imageData: Data, user: UserModel) {
        let userId = (Auth.auth().currentUser?.uid)!
        let storageRef = Storage.storage().reference().child(Constants.DatabaseCollections.profilePicStore).child(userId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        storageRef.putData(imageData, metadata: metadata) { metaData, error in
            if error != nil {
                self.profilePicStoreDelegate?.didRecieveProfilePicStoreResponse(Message: error?.localizedDescription)
            } else {
                self.getStorageUrl(storageRef: storageRef, user: user)
            }
        }
    }
    
    func getStorageUrl(storageRef: StorageReference?, user: UserModel)  {
        storageRef?.downloadURL { url, error in
            if error != nil {
                self.profilePicStoreDelegate?.didRecieveProfilePicStoreResponse(Message: error?.localizedDescription)
            } else {
                UpdateUserData.shared.updateUserUsers(user: user, profilePicUrl: url?.absoluteString ?? "")
                
            }
        }
    }
}


