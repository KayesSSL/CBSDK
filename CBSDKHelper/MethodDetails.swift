//
//  MethodDetails.swift
//  CashBabaSDKiOSApp
//
//  Created by Imrul Kayes on 1/8/25.
//
import Foundation

struct MethodDetails {
    let methodName: String
    let clientId: String
    let clientSecret: String
    let guId: String
    let mobileNumber: String
    let nidNumber: String
    let transactionAmount: String

    func toJson() -> [String: String] {
        return [
            "methodName": methodName,
            "clientId": clientId,
            "clientSecret": clientSecret,
            "guId": guId,
            "mobileNumber": mobileNumber,
            "nidNumber": nidNumber,
            "amount": transactionAmount,
        ]
    }
}

