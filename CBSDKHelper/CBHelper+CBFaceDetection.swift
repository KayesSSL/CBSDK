//
//  CBHelper+.swift
//  CashBabaSDKiOSApp
//
//  Created by Mausum Nandy on 14/1/25.
//
import Flutter
import UIKit

extension CBSDKHelper : CBFaceDetectionSDKDelegate{
   
    
     public func images(smile: String, blink: String) {
        let messageDictionary = ["smile" : smile, "blink":blink]
        let jsonData = try! JSONSerialization.data(withJSONObject: messageDictionary)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        
        
        result?(jsonString)
        
    }
    
    public func userCancelled(_ userBack: String) {
        
    }
    
    public func errorOccured(_ error: String) {
        
    }
    
   
}
