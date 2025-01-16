//
//  UIFont.swift
//  CBFaceDetection
//
//  Created by Mausum Nandy on 25/4/24.
//

import UIKit
extension UIFont{
    enum FontType{
        case Regular,Medium,Bold,Italic,weight(weight:CGFloat)
    }
    
    class func easyMarchantsFont(_ ofType:FontType, ofSize:CGFloat = 17.0) -> UIFont {
        switch  ofType{
        case .Bold:
            return UIFont(name: "AvenirNext-Bold", size: ofSize.y) ?? .systemFont(ofSize: ofSize.y, weight: .bold)
        case .Medium:
            return UIFont(name: "AvenirNext-Medium", size: ofSize.y) ?? .systemFont(ofSize: ofSize.y, weight: .medium)
        case .Regular:
            return UIFont(name:  "AvenirNext-Regular", size: ofSize.y) ?? .systemFont(ofSize: ofSize.y, weight: .regular)
        case .Italic:
            return UIFont(name:"Roboto-italic", size: ofSize.y) ?? .systemFont(ofSize: ofSize.y, weight: .light)
        case .weight(weight: let weight):
            return UIFont(name:  "AvenirNext-Regular", size: ofSize.y)?.withWeight(UIFont.Weight(weight)) ?? .systemFont(ofSize: ofSize.y, weight: UIFont.Weight(weight))
            
          
        }
    }
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
      let newDescriptor = fontDescriptor.addingAttributes([.traits: [
        UIFontDescriptor.TraitKey.weight: weight]
      ])
      return UIFont(descriptor: newDescriptor, size: pointSize)
    }
}
