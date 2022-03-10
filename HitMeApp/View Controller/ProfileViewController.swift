//
//  ProfileViewController.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import UIKit
import Photos
import AVKit

class ProfileViewController: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    //Mark:- Variables
    var imageActionSheet : UIAlertController!
    let imagePicker = UIImagePickerController()
    var selectImage = Data()
    var profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        profileViewModel.setUpTextFieldsUI(textField: userNameTF, placeholder: Constants.Text.userNamePlaceholder)
        profileViewModel.setUpTextFieldsUI(textField: firstNameTF, placeholder: Constants.Text.firstNamePlaceholder)
        profileViewModel.setUpTextFieldsUI(textField: lastNameTF, placeholder: Constants.Text.lastNamePlaceholder)
        setButtonsUI()
    }
    func setUpUI() {
        backgroundImageView.setImageView(image: Constants.Design.Image.profileScreenBackgroundImage)
        titleLbl.withManropeBoldFont(text: Constants.Text.profileScreenTitle, alignment: .center)
        profileImageView.setImageViewLayer(profileImageView.frame.height/2, borderColor: .clear, borderWidth: 0)
        profileImageView.setImageView(image: Constants.Design.Image.defaultPicture)
        setTargetToTextField(textfield: userNameTF)
        setTargetToTextField(textfield: firstNameTF)
        setTargetToTextField(textfield: lastNameTF)
        userNameTF.hideRightView()
    }
    
    func setButtonsUI() {
        backBtn.setBackButton()
        nextBtn.setButtonText(Constants.Text.next)
        nextBtn.setButtonLayer(Constants.CornerRadius.cornerRadius, borderColor: Constants.Design.Color.yellow, borderWidth: 1)
    }
    func setTargetToTextField(textfield: UITextField) {
        textfield.addTarget(self, action: #selector(self.textFieldDidChangeValue(_:)), for: .editingChanged)
    }
    
    //Mark:- Actions
    
    @objc func textFieldDidChangeValue(_ textField: UITextField) {
        switch textField {
        case userNameTF:
            CheckUsernameAvailable.shared.checkUsernameDelegate = self
            CheckUsernameAvailable.shared.checkUsername(username: textField.text ?? "")
            break
        default:
            break
        }
        if (textField.text!.isEmpty) {
            profileViewModel.setButtonAndTextfieldWithorWithoutValue(color: Constants.Design.Color.grey, textField: textField)
        } else {
            profileViewModel.setButtonAndTextfieldWithorWithoutValue(color: Constants.Design.Color.yellow, textField: textField)
        }
    }
    
    // Mark:- IBActions
    @IBAction func onClickNextBtn(_ sender: Any) {
        let message = ProfileValidation().ValidateTextField(firstName: firstNameTF.text, lastName: lastNameTF.text, userName: userNameTF.text).error
        let success = ProfileValidation().ValidateTextField(firstName: firstNameTF.text, lastName: lastNameTF.text, userName: userNameTF.text).success
        if success {
            UpdateUserData.shared.updateUserDataDelegate = self
            ProfilePicStore.shared.profilePicStoreDelegate = self
            storeProfile()
        } else {
            SwiftAlert().show( message: message ?? "", viewController: self)
        }
    }
    
    func storeProfile() {
        let imageSuccess = ProfileValidation().validateImage(image: selectImage).success
        let imageMessage = ProfileValidation().validateImage(image: selectImage).error
        if imageSuccess {
            startLoading()
            ProfilePicStore.shared.storeProfilePic(imageData: selectImage, user: storeValueInUser())
        } else {
            SwiftAlert().show( message: imageMessage ?? "", viewController: self)
        }
    }
    
    @IBAction func onClickProfileBtn(_ sender: Any) {
        checkForCameraAuthorisation()
    }
    
    // Mark:- Check user authorise for camera and photo library
    func checkForCameraAuthorisation() {
        
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        switch cameraAuthorizationStatus {
        case .authorized:
            self.setUpActionSheetImage()
            break
        case .denied,.notDetermined,.restricted:
            promtUserForCameraAuthorisation()
            break
        default:
            break
        }
    }
    //Mark:- Prompt user for allow the permissons of camera and photo library
    func promtUserForCameraAuthorisation() {
        Utils().callCameraPermisson()
        Utils().callGalleryPermisson()
    }
}

