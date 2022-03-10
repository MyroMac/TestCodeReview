//
//  Utils.swift
//  HitMeApp
//
//  Created by Mac on 07/03/22.
//

import Foundation
import UIKit
import Photos
import AVKit

class Utils {
    //Mark:- Ask user for camera permisson
    func callCameraPermisson() {
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {} else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in})}
    }
    //Mark:- Ask user for photo library permisson
    func callGalleryPermisson() {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            checkForAuthorisation()
        }
    }
    func checkForAuthorisation() {
        PHPhotoLibrary.requestAuthorization({status in
            if status == .authorized{}})
    }
    //Mark:- Calculate the height of collectionView
    func calculateCollectionViewHeight(count: Int, cellPerRow: Int) -> CGFloat {
        return CGFloat(((Int(Constants.AppInfo.screenWidth) / cellPerRow) * count) / cellPerRow)
    }
    //Mark:- Set Button and Textfield
    func setButtonAndTextfieldWithorWithoutValue(color: UIColor, textField: UITextField, button: UIButton) {
        textField.customizeTextField(cornerRadius: Constants.CornerRadius.cornerRadius, borderWidth: 1, borderColor: color)
        button.setButtonBackgroundColor(color)
    }
    func pushToProfileViewController(message: String, viewController: UIViewController) {
        SwiftAlert().show( message: message, viewController: viewController) {
            viewController.moveToNext("ProfileEditViewController")
        }
    }
    
}
