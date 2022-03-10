//
//  ButtonStylingClass.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func setButtonText(_ text: String, textColor: UIColor = Constants.Design.Color.black, font: UIFont = UIFont(name: Constants.Design.Font.ManropeBold, size: Constants.Design.FontSize.joinSquad)!) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = font
       
    }
    func setButtonBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    func setButtonImage(_ image: UIImage) {
        self.setImage(image, for: .normal)
    }
    func setButtonLayer(_ cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    func setButtonOfNext() {
        self.setButtonText(Constants.Text.next, textColor: Constants.Design.Color.nextButtonTitleDarkGrayColor)
        self.setButtonLayer(Constants.CornerRadius.cornerRadius, borderColor: .clear, borderWidth: 0)
        self.setButtonBackgroundColor(Constants.Design.Color.grey)
    }
    func setBackButton() {
        self.setButtonImage(Constants.Design.Image.back)
        self.setButtonBackgroundColor(Constants.Design.Color.white)
        self.setButtonLayer(Constants.CornerRadius.cornerRadius, borderColor: .clear, borderWidth: 0)
    }
}


