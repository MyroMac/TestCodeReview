//
//  Date+Extension.swift
//  HitMeApp
//
//  Created by Mac on 05/03/22.
//

import Foundation
import UIKit

extension Date {
    func dateToString(fomrat:String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = fomrat
        return dateformatter.string(from: self)
    }
}
