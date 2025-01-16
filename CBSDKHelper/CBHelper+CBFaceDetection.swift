//
//  CBHelper+.swift
//  CashBabaSDKiOSApp
//
//  Created by Mausum Nandy on 14/1/25.
//
import Flutter
import UIKit

extension CBSDKHelper : CBFaceDetectionSDKDelegate{
   
    
     func images(smile: String, blink: String) {
        let messageDictionary = ["smile" : smile, "blink":blink]
        let jsonData = try! JSONSerialization.data(withJSONObject: messageDictionary)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        
        
        result?(jsonString)
        
    }
    
    func userCancelled(_ userBack: String) {
        
    }
    
    func errorOccured(_ error: String) {
        
    }
    
   
}
