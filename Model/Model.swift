//
//  Model.swift
//  AliPaymentGateway
//
//

import Foundation

public struct paymentDetailsData: Encodable {


    public var merchantId: String
    public var usrname: String
    public var password: String
    public var apiKey: String
    public var orderId: String
    public var totalPrice: String
    public var currencyCode: String
    public var testMode: String
    public var success_url: String
    public var errorUrl: String
    public var customerFullName:String
    public var customerEmail:String
    public var customerMobile:String
    public var productTitle:String
    public var productName:String
    public var productPrice:String
    public var productQty:String
    public var reference:String
    public var notifyURL:String

    public init() {
        merchantId = ""
        usrname = ""
        password = ""
        apiKey = ""
        orderId = ""
        totalPrice = ""
        currencyCode = ""
        testMode = ""
        success_url = ""
        errorUrl = ""
        customerFullName = ""
        customerEmail = ""
        customerMobile = ""
        productTitle = ""
        productName = ""
        productPrice = ""
        productQty = ""
        reference = ""
        notifyURL = ""


//        success_url = "https://example.com/success.html"
//        errorUrl = "https://example.com/error.html"
//        usrname = "test"
//        password = "test"
//        apiKey = "jtest123"
    }

    enum CodingKeys: String, CodingKey {
        case merchantId = "merchant_id"
        case usrname = "username"
        case password = "password"
        case apiKey = "api_key"
        case orderId = "order_id"
        case totalPrice = "total_price"
        case currencyCode = "CurrencyCode"
        case testMode = "test_mode"
        case success_url = "success_url"
        case errorUrl = "error_url"
        case customerFullName = "CstFName"
        case customerEmail = "CstEmail"
        case customerMobile = "CstMobile"
        case productTitle = "ProductTitle"
        case productName = "ProductName"
        case productPrice = "ProductPrice"
        case productQty = "ProductQty"
        case reference = "Reference"




    }
}

public struct PaymentResponse{
    public var message:String = ""
    public var transectionDetails:Transaction_Details = Transaction_Details()
}

public struct Transaction_Details:Encodable {
    var paymentType:String
    var paymentID:String
    var result:String
    var orderID:String
    var postDate:String
    var tranID:String
    var ref:String
    var trackID:String
    var auth:String
    var cust_ref:String
    var trnUdf:String


    init() {
        paymentType = ""
        paymentID = ""
        result = ""
        orderID = ""
        postDate = ""
        tranID = ""
        ref = ""
        trackID = ""
        auth = ""
        cust_ref = ""
        trnUdf = ""

    }
    enum CodingKeys: String, CodingKey {
        case paymentType = "payment_type"
        case paymentID = "PaymentID"
        case result = "Result"
        case orderID = "OrderID"
        case postDate = "PostDate"
        case tranID = "TranID"
        case ref = "Ref"
        case trackID = "TrackID"
        case auth = "Auth"
    }
}

extension Encodable {
    public func toJSON() -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let data = try? encoder.encode(self) {
            return try! JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
        }
        return [:]
    }
}


enum ApiConstants {
    enum Headers {
        // Base headers
        static let authorization = "Authorization"
        static let contentType = "Content-Type"
    }
    
    enum HeaderValues {
        // Base header values
        static let jsonContentType = "application/json"
        static let formUrlencodedType = "application/x-www-form-urlencoded"
    }
}

enum ApiType {
    static let post = "POST"
    static let get = "GET"
}

enum ApiPaths {
    static let payment = "test-payment"
}

enum ResponseStatus {
  static let success = "success"
  static let failure = "errors"
}

enum ErrorCodes : String {
    
  case MissingMerchantId = "merchant_id_missing"
  case MissingUSerName = "username_missing"
  
}


