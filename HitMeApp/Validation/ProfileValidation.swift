//
//  ProfileValidation.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation

struct ValidationResult {
    let success: Bool
    let error: String?
}

struct ProfileValidation {
    func ValidateTextField(firstName: String?, lastName: String?, userName: String?) -> ValidationResult {
        
        if firstName == nil {
            return ValidationResult(success: false, error: Constants.AlertMessages.firstName)
        }
        if lastName == nil {
            return ValidationResult(success: false, error: Constants.AlertMessages.lastName)
        }
        if userName == nil {
            return ValidationResult(success: false, error: Constants.AlertMessages.enteruserName)
        }
        return ValidationResult(success: true, error: nil)
    }
    
    func validateImage(image: Data) -> ValidationResult {
        if image.count == 0 {
            return ValidationResult(success: false, error: Constants.AlertMessages.selectImage)
        }
        return ValidationResult(success: true, error: nil)
    }
}
