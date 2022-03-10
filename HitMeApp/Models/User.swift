//
//  User.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation

struct UserModel : Codable {
    var  uid, phoneNumber, userName, firstName, lastName, profileImageUrl, dateCreated : String?
    
    init(uid: String, phoneNumber: String, firstName: String?, userName: String?, lastName: String?, profileImageUrl: String, dateCreated: String?) {
        
        
        self.uid = uid
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.profileImageUrl = profileImageUrl
        self.dateCreated = dateCreated
    }
    enum CodingKeys: String, CodingKey {
        
        case uid = "userId"
        case phoneNumber = "phoneNumber"
        case firstName = "firstName"
        case lastName = "lastName"
        case userName = "username"
        case profileImageUrl = "profileImageUrl"
        case dateCreated = "dateCreated"
        
    }
    func encode() -> Dictionary<String, Any> {
        do {
            let data = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String :Any] ?? [:]
            return dict
        } catch let error {
            print(error)
            return [:]
        }
    }
}
