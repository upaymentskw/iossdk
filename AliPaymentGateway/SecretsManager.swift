//
//  SecretsManager.swift
//  AliPaymentGateway
//
//  Created by **** on 15/03/21.
//

import Foundation


public class SecretsManager{
    private var isAuthoried:Bool

    public init(key:String){
        isAuthoried = Approved.keys.contains(key) ? true : false
    }

    public func readSecret() -> String?{
        isAuthoried ? "user authorization successful." : "Invalid User."
    }
    
    public func apiCall() {
        
    }
}

