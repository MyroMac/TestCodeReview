//
//  UserDefaults+Helpers.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation

class DefaultsHelper {
    
    private enum Keys : String {
        case verificationId = "verificationId"
    }
    
    private static let userDefaults = UserDefaults.standard
    
    static func setVerificationId(verificationId : String) {
        userDefaults.set(verificationId, forKey: Keys.verificationId.rawValue)
        userDefaults.synchronize()
    }
    
    static func getVerificationId() -> String? {
        return userDefaults.string(forKey: Keys.verificationId.rawValue)
    }
}
