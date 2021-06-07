//
//  APG.swift
//  AliPaymentGateway
//


import Foundation

public protocol APG {
    var allPaymentStoreUseCase: AllPaymentStoreUseCase { get }
}

public class APGImplementation: APG {
    
    private static var sharedInstance = APGImplementation()

    /// The shared instance of the APG protocol.
    public static var shared: APG {
        sharedInstance
    }
    
    public var allPaymentStoreUseCase: AllPaymentStoreUseCase {
        AllPaymentStoreImplementation()
    }
}
