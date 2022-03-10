//
//  ProfileViewModel.swift
//  HitMeApp
//
//  Created by Mac on 07/03/22.
//

import Foundation
import UIKit


struct ProfileViewModel {
    
    func setUpTextFieldsUI(textField: UITextField, placeholder: String) {
        
        textField.changePlaceholderText(placeholderText: placeholder)
        textField.customizeTextField(cornerRadius: Constants.CornerRadius.cornerRadius, borderWidth: 1, borderColor: Constants.Design.Color.grey)
        textField.with()
        textField.addPadding(.both(Constants.Padding.padding))
    }
    
    func setButtonAndTextfieldWithorWithoutValue(color: UIColor, textField: UITextField) {
        textField.customizeTextField(cornerRadius: Constants.CornerRadius.cornerRadius, borderWidth: 1, borderColor: color)
    }
}
// Mark:- Delegate funstions of imagepickercontroller
extension ProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Mark:- Open Action sheet for selection of camer and phot library
    func setUpActionSheetImage() {
        
        imageActionSheet = UIAlertController(title: Constants.Text.imageActionSheetTitle, message: Constants.Text.imageSelectionMessage, preferredStyle: .actionSheet)
        let cancelAction: UIAlertAction = UIAlertAction(title: Constants.Text.cancel, style: .cancel) { action -> Void in
        }
        imageActionSheet.addAction(cancelAction)
        let takePhotoAction: UIAlertAction = UIAlertAction(title: Constants.Text.takePhoto, style: .default) { action -> Void in
            self.imagePicker.sourceType = .camera
        }
        imageActionSheet.addAction(takePhotoAction)
        let galleryAction: UIAlertAction = UIAlertAction(title: Constants.Text.chooseImage, style: .default) { action -> Void in
            self.imagePicker.sourceType = .photoLibrary
        }
        imageActionSheet.addAction(galleryAction)
        self.imagePicker.delegate = self
        self.present(self.imagePicker, animated: true, completion: nil)
        present(imageActionSheet, animated: true) {}
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImageView.image = chosenImage
        self.selectImage = chosenImage.jpegData(compressionQuality: 0.1) ?? Data()
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
    func storeValueInUser() -> UserModel {
        let user = UserModel.init( uid: "", phoneNumber: "", firstName: firstNameTF.text!, userName: userNameTF.text!, lastName: lastNameTF.text!, profileImageUrl: "", dateCreated: nil)
        return user
    }
}
// Mark:- Delegate functions of update profile
extension ProfileViewController: UpdateUserDataDelegate, ProfilePicStoreDelegate {
    func didRecieveProfilePicStoreResponse(Message: String?) {
        stopLoading()
        SwiftAlert().show( message: Message!, viewController: self)
    }
    
    func didRecieveUpdateUserDataResponse(Message: String?) {
        stopLoading()
        Utils().pushToProfileViewController(message: Message!, viewController: self)
    }
}

//Mark:- Delegate function for checking user name available or not
extension ProfileViewController: CheckUserNameDelegate {
    func didRecieveCheckUsernameResponse(bool: Bool) {
        if bool {
            userNameTF.showRightView(icon: Constants.Design.Image.tick)
        } else {
            userNameTF.hideRightView()
        }
    }
}
