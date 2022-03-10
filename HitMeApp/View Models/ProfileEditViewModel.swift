//
//  ProfileEditViewModel.swift
//  HitMeApp
//
//  Created by Mac on 08/03/22.
//

import Foundation
import UIKit


struct ProfileEditViewModel {
    
    func setLabel(label: UILabel, text: String) {
        let sfFont = UIFont(name: Constants.Design.Font.SFProTextLight, size: Constants.Design.FontSize.profileViewFontSize13)!
        label.with(text: text, font: sfFont, alignment: .center)
    }
}
//Mark:- CollectionView Delegate functions
extension ProfileEditViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Design.ImagesCollections.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileImagesCollectionViewCell", for: indexPath) as! ProfileImagesCollectionViewCell
        let image = Constants.Design.ImagesCollections.images[indexPath.row]
        cell.imgesIV.setImageView(image: image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = Constants.AppInfo.screenWidth / 3
        let size = CGSize(width: width, height: width)
        return size
        
    }
}

//Mark: - Delegate function for getting user data
extension ProfileEditViewController: GetUserDeleagte {
    func didRecieveGetUserResponse(error: Error?, errorMessage: String?, user: [String : Any]?) {
        self.stopLoading()
        if error != nil {
            SwiftAlert().show(message: errorMessage!, viewController: self)
        } else {
            guard let firstName = user?["firstName"] as? String else { return }
            self.nameLbl.withManropeBoldFont(text: firstName.localizedUppercase, alignment: .center)
            setProfileImage(user: user)
        }
    }
    
    func setProfileImage(user: [String : Any]?) {
        guard let imageUrlStr = user?["profileImageUrl"] as? String else { return }
        guard let imageUrl = URL(string: imageUrlStr) else { return }
        self.profileIV.kf.setImage(with: imageUrl)
    }
    
    func callGetUserDetail() {
        CheckUserInDataBase.shared.getUserDelegate = self
        self.startLoading()
        CheckUserInDataBase.shared.getUserData()
    }
    
    func setUpCollectionView() {
        self.heightConstraintOfCollectionView.constant = Utils().calculateCollectionViewHeight(count: Constants.Design.ImagesCollections.images.count, cellPerRow: 3)
    }
}
