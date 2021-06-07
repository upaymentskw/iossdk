//
//  Card.swift
//  AliPaymentGateway
//
//  Created by *** on 16/03/21.
//

import Foundation
public class Card : NSObject, Codable {

     final public let number: String

     final public let expiryMonth: String

     final public let expiryYear: String

     final public let brand: String

     final public let issuer: String?

}
