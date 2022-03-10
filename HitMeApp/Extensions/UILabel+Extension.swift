//
//  UILabel+Extension.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func with(text: String, font: UIFont = UIFont(name: Constants.Design.Font.ManropeSemiBold, size: Constants.Design.FontSize.Subtitle)!, alignment: NSTextAlignment = .natural) {
        
        self.text = text
        self.font = font
        self.textColor = Constants.Design.Color.black
        self.numberOfLines = 0
        self.textAlignment = alignment
    }
    func withManropeBoldFont(text: String, font: UIFont = UIFont(name: Constants.Design.Font.ManropeBold, size: Constants.Design.FontSize.phoneNumberScreenTitle)!, alignment: NSTextAlignment = .natural) {
        
        self.text = text
        self.font = font
        self.textColor = Constants.Design.Color.black
        self.numberOfLines = 0
        self.textAlignment = alignment
    }
    func withManropeMediumFont(text: String, font: UIFont = UIFont(name: Constants.Design.Font.ManropeMedium, size: 10)!) {
        
        self.text = text
        self.font = font
        self.textColor = Constants.Design.Color.black
        self.numberOfLines = 0
        self.textAlignment = .center
    }
}
