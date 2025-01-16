//
//  UIColor.swift
//  ssl_commerz_revamp
//
//  Created by Mausum Nandy on 5/20/21.
//

import Foundation
import UIKit
extension UIColor {
    
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 237.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var vermillion: UIColor {
        return UIColor(red: 230.0 / 255.0, green: 65.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 88.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brownGrey: UIColor {
        return UIColor(white: 149.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var seperatorColor: UIColor {
        return UIColor(white: 220.0 / 255.0, alpha: 1.0)
    }
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
@objc extension UIImageView{
    func setImageFromBundle(_ callerClass: AnyClass, imageName: String){
        self.image = UIImage(named: imageName, in: Bundle(for: callerClass), compatibleWith: nil)
    }
}

@objc extension UIButton{
    func setImageFromBundle(_ callerClass: AnyClass, imageName: String, for state: UIControl.State){
        self.setImage(UIImage(named: imageName, in: Bundle(for: callerClass), compatibleWith: nil), for: state)
    }
}

@objc extension UIImage{
    static func imageFromBundle(_ callerClass: AnyClass, imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: Bundle(for: callerClass), compatibleWith: nil)
    }
}
extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
