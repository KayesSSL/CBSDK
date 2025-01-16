//
//  CBSDKHelper.swift
//  CashBabaSDKiOSApp
//
//  Created by Mausum Nandy on 14/1/25.
//

import Flutter
import FlutterPluginRegistrant
import UIKit


@objc public protocol CBSDKHelperDelegate: AnyObject {
    @objc optional func registrationSuccess(data: [String: Any])
    @objc optional func accountLinkingSuccess(guId: String)
    @objc optional func balanceRetrievalSuccess(balance: String)
    @objc optional func transactionSuccess(transactionDetails: [String: Any])
    @objc optional func didEncounterError(error: String)
}


enum MethodName : String{
    case sendBalance = "sendBalance"
    case resultError = "resultError"
    case sendGuId = "sendGuId"
    case registrationSuccess = "registrationSuccess"
    case transactionSuccess = "transactionSuccess"
    case verifyFace = "verify_face"
    
}


public class CBSDKHelper : NSObject{
    private var flutterEngine: FlutterEngine?
    private let CHANNEL = "cashbaba_merchant_sdk_method_channel"
    private let flutterEngineId = "123456789"
    private let clientId: String
    private let clientSecret: String
    private let GuiId: String
    private let sourceVC : UIViewController
    private var flutterMethodChannel: FlutterMethodChannel?
    var guidCallback: ((String) -> Void)?
    var result: FlutterResult?
    public var delegate: CBSDKHelperDelegate?
    
    //MARK: - Public Methods
    
    public init(in Vc: UIViewController, with clientId: String,  clientSecret: String,  GuiId: String) {
        self.sourceVC = Vc
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.GuiId = GuiId
    }
    
   
    
    
    public  func  showBalance() { //callback: @escaping (String) -> Void
        setupSDKPreferences()
        guard let flutterMethodChannel  = self.flutterMethodChannel  else { return }
//        self.guidCallback = callback
        let methodDetails = MethodDetails(
            methodName: "Balance",
            clientId: clientId,
            clientSecret: clientSecret,
            guId: GuiId,
            mobileNumber: "",
            nidNumber: "",
            transactionAmount: ""
        )
        flutterMethodChannel.invokeMethod("initializeSdk", arguments: methodDetails.toJson()) { _ in
            
        }
        
        self.methodCall(methodChannel: flutterMethodChannel)
    }
    
    public func linkAccount(mobile: String, nid:String, callback: @escaping (String) -> Void) {
        setupSDKPreferences()
        guard let flutterMethodChannel  = self.flutterMethodChannel  else { return }
        self.guidCallback = callback
        let methodDetails = MethodDetails(
            methodName: "Link",
            clientId: clientId,
            clientSecret: clientSecret,
            mobileNumber: mobile,
            nidNumber: nid
        )
        flutterMethodChannel.invokeMethod("initializeSdk", arguments: methodDetails.toJson()) { _ in
            
        }
        
        self.methodCall(methodChannel: flutterMethodChannel)
    }
    
    public func registration(registrationArguments: RegistrationArguments) {
        
        setupSDKPreferences()
        guard let flutterMethodChannel  = self.flutterMethodChannel  else { return }
        let methodDetails = MethodDetails(
            methodName: "Registration",
            clientId: clientId,
            clientSecret: clientSecret,
            registrationArguments: registrationArguments
        )
        
        
        flutterMethodChannel.invokeMethod("initializeSdk", arguments: methodDetails.toJson()) { _ in
            
        }
        
        self.methodCall(methodChannel: flutterMethodChannel)
        
        
    }
    
    public func transaction(nid: String, transactionAmount: String) {
        setupSDKPreferences()
        guard let flutterMethodChannel  = self.flutterMethodChannel  else { return }
        let methodDetails = MethodDetails(
            methodName: "Transaction",
            clientId: clientId,
            clientSecret: clientSecret,
            guId: GuiId,
            nidNumber: nid,
            transactionAmount: transactionAmount
        )
        
        
        flutterMethodChannel.invokeMethod("initializeSdk", arguments: methodDetails.toJson()) { _ in
            
        }
        
        self.methodCall(methodChannel: flutterMethodChannel)
    }
    
    
    
    
    //MARK: - Response Handlers
   
    private   func handleresultError(errorArgs : Any?){
        if let args = errorArgs as? [String: String]{
            print(args["error"])
            self.delegate?.didEncounterError?(error: args["error"] ?? "")
        }
        
    }
    
    private  func registraionVCcallback(arguments: Any?, result: @escaping FlutterResult) {
        
        self.result = result
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        
        let sdk = CBFaceDetectionSDK(inViewController: topController, delegate: self,strings: arguments)
        sdk.launch()
        
        
        
    }
    
    private func linkSuccess(args : Any?, result: @escaping FlutterResult){
        if let arguments : [String: String] = args as? [String : String]{
            print(arguments["guId"])
            guidCallback?(arguments["guId"] ?? "")
            result(arguments["guId"] ?? "")
            delegate?.accountLinkingSuccess?(guId: arguments["guId"] ?? "")
        }
     
    }
    
    
    
    //MARK: - Setup Methods
    
    
    private func methodCall(methodChannel: FlutterMethodChannel) {
        
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            print(call.method)
            dump(call.arguments)
            
            if let method = MethodName(rawValue: call.method) {
                switch method{
                case .registrationSuccess:
                    print("registration success")
                    result("registration success")
                    self.delegate?.registrationSuccess?(data: call.arguments as? [String: Any] ?? [:])
                case .resultError:
                    print("resultError")
                    self.handleresultError(errorArgs: call.arguments)
                    result("error")
                case .sendBalance:
                    print("sendBalance")
                    if let balance = call.arguments as? [String: String] {
                        self.delegate?.balanceRetrievalSuccess?(balance: balance["balance"] ?? "")
                        result("balance success")
                    }
                    
                case .transactionSuccess:
                    print("transactionSuccess")
                    self.delegate?.transactionSuccess?(transactionDetails: call.arguments as? [String: Any] ?? [:])
                    result("transaction success")
                case .sendGuId:
                    print("sendGuId")
                    self.linkSuccess(args: call.arguments, result: result)
                    result("GUID successfully sent")
                case .verifyFace:
                    DispatchQueue.main.async(execute: {
                        self.registraionVCcallback(arguments: call.arguments, result: result)
                    })
                    
                }
                
            } else {
                print("Invalid Method name")
                result(FlutterMethodNotImplemented)
                return
            }
            
            
            
            
            
            // Hold the result callback to send data back to Flutter
            print("output: \(String(describing: result))")
            
        }
    }
    
    deinit {
        flutterEngine?.destroyContext()
        flutterEngine = nil
        
    }
    
    private func setupSDKPreferences() {
        guard flutterEngine == nil else {
            print("Flutter engine is already running.")
            return
        }
        
        
        flutterEngine = FlutterEngine(name: "flutter_engine_\(UUID().uuidString)")
        guard let engine = flutterEngine else { return }
        
        engine.run()
        GeneratedPluginRegistrant.register(with: engine)
        self.result = nil
        self.flutterMethodChannel = FlutterMethodChannel(
            name: self.CHANNEL,
            binaryMessenger: flutterEngine!.binaryMessenger
        )
        DispatchQueue.main.async {
            if self.sourceVC.presentedViewController == nil {
                let flutterVC = FlutterViewController(engine: self.flutterEngine!, nibName: nil, bundle: nil)
                flutterVC.modalPresentationStyle = .fullScreen
                if #available(iOS 13, *) {
                    flutterVC.isModalInPresentation = true
                }
                self.sourceVC.present(flutterVC, animated: true, completion: nil)
                flutterVC.presentationController?.delegate = self
            } else {
                print("Another view controller is already presented.")
            }
        }
    }
}




extension CBSDKHelper: UIAdaptivePresentationControllerDelegate {
    
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        flutterEngine?.destroyContext()
        flutterMethodChannel = nil
      
        flutterEngine = nil
        
    }
}
