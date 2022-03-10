//
//  UITextField+Extension.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit


extension UITextField {
    
    enum PaddingSide {
        case both(CGFloat)
    }
    func with(text: String = "", font: UIFont = UIFont(name: Constants.Design.Font.ManropeSemiBold, size: Constants.Design.FontSize.Subtitle)!, color: UIColor = Constants.Design.Color.black) {
        
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = .left
    }
    
    func customizeTextField(cornerRadius : CGFloat = 5.0,borderWidth : CGFloat = 0.5,borderColor : UIColor = .black) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor =  borderColor.cgColor
    }
    
    func changePlaceholderColor(color : UIColor,with placeholderText : String) {
        
        let range = (placeholderText as NSString).range(of: placeholderText)
        let attribute = NSMutableAttributedString.init(string: placeholderText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
        self.attributedPlaceholder = attribute
    }
    
    func changePlaceholderColor(color : UIColor) {
        
        let range = (self.placeholder! as NSString).range(of: self.placeholder!)
        let attribute = NSMutableAttributedString.init(string: self.placeholder!)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
        self.attributedPlaceholder = attribute
    }
    
    func changePlaceholderText(placeholderText : String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholderText)
    }
    
    func showRightView(icon: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView.contentMode = .scaleAspectFill
        imageView.image = icon.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8))
        self.rightViewMode = .always
        self.rightView = imageView
    }
    func hideRightView() {
        self.rightViewMode = .never
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        switch padding {
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
     func actionForTextfield(button: UIButton) {
         Constants.Design.button = button
         self.addTarget(self, action: #selector(changeValue(_:)), for: .editingChanged)
      
    }
    
    @objc func changeValue(_ button: UIButton) {
        Utils().setButtonAndTextfieldWithorWithoutValue(color: self.text == "" ? Constants.Design.Color.grey : Constants.Design.Color.yellow, textField: self, button: Constants.Design.button)
    }
}
