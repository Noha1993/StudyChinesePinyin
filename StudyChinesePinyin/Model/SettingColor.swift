//
//  SettingColor.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/13.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import Foundation
import UIKit

class SettingColor {
    class var primary: UIColor {
        return rgbColor(rgbValue: 0x73C6B6)
    }
    class var secondary: UIColor{
        return rgbColor(rgbValue: 0xFFD6BA)
    }
    class var background: UIColor{
        return rgbColor(rgbValue: 0xFAF9F9)
    }
    private class func rgbColor(rgbValue: UInt) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
