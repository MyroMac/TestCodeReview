//
//  ImageViewStylingClass.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    
     func setImageView(image: UIImage) {
        self.image = image
    }
    
    func setImageViewLayer(_ cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}


