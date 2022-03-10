//
//  ViewStylingClass.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

extension UIView {
    func setViewBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func setViewLayer(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = 7

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}


