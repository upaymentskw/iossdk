//
//  ViewController.swift
//  SampleProject
//
//  Created by Vijay Singh on 04/08/23.
//

import UIKit
import AliPaymentGateway
import DropDown
class ViewController: UIViewController {

    @IBOutlet weak var paymentTypeTxt: UITextField!
    @IBOutlet weak var viewShowDropDown: UIView!
    //@IBOutlet weak var headerTokenTxt: UITextField!
    
    @IBOutlet weak var btnWhiteListIp : UIButton!
    @IBOutlet weak var btnNonWhiteListIp : UIButton!
    
    let payment : AllPaymentStoreUseCase = APGImplementation.shared.allPaymentStoreUseCase
    var customerUnique = ""
    var strSrcValue = ""
    var arrPaymentButton = [String]()
    var arrUserEnterMultiRefaundData = [[String:String]]()
    var strOrderId = ""
    var strApiToken = ""
    var strSingleDeleteOrderId = ""
    var strSingleDefundOrderId = ""
    
    var strMultiDeleteRefundInvoiceId = ""
    var strMultiDeleteOrderId = ""
    var strMultiDeleteRefundArn = ""
    var strMultiDeleteRefundOrderId = ""
    
    var strWhiteListStatus = ""
    var strApiType = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //Production Sandbox
        //if use Sandbox then sandbox base url working
        //if use Production then Production base url working
        payment.changeBaseUrl(urlType: "Production")
        viewShowDropDown.isHidden = true
        self.navigationController?.setStatusBar(backgroundColor: UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0))
        navigationController?.navigationBar.isHidden = true
        btnNonWhiteListIp.backgroundColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        btnNonWhiteListIp.setTitleColor(UIColor.white, for: .normal)
        
        btnWhiteListIp.backgroundColor = UIColor.white
        btnWhiteListIp.setTitleColor(UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0), for: .normal)
        
        btnWhiteListIp.layer.borderColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0).cgColor
        btnWhiteListIp.layer.borderWidth = 1
        //strApiToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5"
        strApiToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5"
        self.strSrcValue = "knet"
        self.arrUserEnterMultiRefaundData  = [["amountToRefund":"1","ibanNumber":"KW91KFHO0000000000051010173254"],["amountToRefund":"1","ibanNumber":"KW91KFHO0000000000051010173254"]]
        self.getCustomerUnique()
        checkButtonStatus()
        
    }
    
    
    @IBAction func tapToSelectwhiteListIp(_sender : UIButton) {
        btnWhiteListIp.backgroundColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        btnWhiteListIp.setTitleColor(UIColor.white, for: .normal)
        
        btnNonWhiteListIp.backgroundColor = UIColor.white
        btnNonWhiteListIp.setTitleColor(UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0), for: .normal)
            
        btnNonWhiteListIp.layer.borderColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0).cgColor
        btnNonWhiteListIp.layer.borderWidth = 1
        //strApiToken = "aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2"
          strApiToken = "aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2"
        self.strWhiteListStatus = "2"
    }

    @IBAction func tapToSelectNonWhiteListIp(_sender : UIButton) {
        btnNonWhiteListIp.backgroundColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        btnNonWhiteListIp.setTitleColor(UIColor.white, for: .normal)
        
        btnWhiteListIp.backgroundColor = UIColor.white
        btnWhiteListIp.setTitleColor(UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0), for: .normal)
        
        btnWhiteListIp.layer.borderColor = UIColor.init(red: 56.0/255.0, green: 22.0/255.0, blue: 176.0/255.0, alpha: 1.0).cgColor
        btnWhiteListIp.layer.borderWidth = 1
        //strApiToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5"
        strApiToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5"
        
        self.strWhiteListStatus = "1"
    }
    
    
    func checkButtonStatus() {
        payment.getCheckPaymentButtonStatus(headerToken:strApiToken,controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                guard let paybuttonData = response.data?.payButtons else {
                    return
                }
                //self.showAlert(status: response.message ?? "", responseMessage: response)
                self.arrPaymentButton.removeAll()
                for (k,v) in paybuttonData{
                    if v == true{
                        self.arrPaymentButton.append(k)
                    }
                }
                
                //self.singleChargeApi()
                //self.showPaymentTypeDropDown()
               print(self.arrPaymentButton)
                self.getCustomerUnique()
            case .failure(let error):
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
                self.getCustomerUnique()
            }
            
        })
    }

    func getCustomerUnique() {
        let strCustomerUnique = UserDefaults.standard.string(forKey: "customerUnique")
        if strCustomerUnique == nil {
            createNewToken()
        }
        else {
            self.customerUnique = UserDefaults.standard.string(forKey: "customerUnique") ?? ""
            print(self.customerUnique)
        }
    }
    
    @IBAction func tapToChargeApiBuySingleProduct(_ sender: Any) {
        if  self.strWhiteListStatus == "2" {
            strApiType = "1"
            showPaymentTypeDropDown()
           
        }
        else {
            self.singleChargeApi()
        }
    }
    
    func singleChargeApi() {
        let product: Product = Product(name: "Logitech K380", description: "Logitech K380 / Easy-Switch for Upto 3 Devices, Slim Bluetooth Tablet Keyboard ", price: 1, quantity: 1)
        let product1: Product = Product(name: "2-Logitech K380", description: "Logitech K380 / Easy-Switch for Upto 3 Devices, Slim Bluetooth Tablet Keyboard ", price: 1, quantity: 1)
        var products = [Product]()
        products.append(product)
        products.append(product1)
        
        
       
        let order : Order = Order(id:"202210101255255144669",reference:"11111991" ,description: "Purchase order received for Logitech K380 Keyboard",currency: "KWD",amount: 0.100)
        let payGateway : PaymentGateway = PaymentGateway(src: self.strSrcValue) //samsung_pay
        //let payGateway : PaymentGateway = PaymentGateway(src: "samsung-pay")
       
        let token : Tokens = Tokens(kFast: "",creditCard: "",customerUniqueToken: self.customerUnique)
        let ref : Reference = Reference(id: "202210101202210101")
        let customer : Customer = Customer(uniqueID: "2129879kjbljg767881",name: "Jhon Smith",email: "jhon.smith@upayments.com",mobile: "+96512345678")
        let plugin : Plugin = Plugin(src: "magento")
        let browserDetail : BrowserDetails = BrowserDetails(screenWidth: "1920",screenHeight: "1080",colorDepth: "24",javaEnabled: "true",language: "en", timeZone: "-180")
        let device : Device = Device(browser: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0",browserDetails: browserDetail)
        let createPaymentNewRequest = CreatePaymentRequest(product: products, extraMerchantData:nil, sessionID: "", isTest: true, order: order, paymentGateway: payGateway, notificationType: "all", language: "en", isSaveCard: false, isWhitelabled: true, tokens: token, reference: ref, customer: customer, plugin: plugin, customerExtraData: "test data", returnURL: "https://upayments.com/en/", cancelURL: "https://www.error.com", notificationURL: "https://webhook.site/ce503866-6bb3-4c58-a2f2-a0fa028f10ea", device: device)
        print(createPaymentNewRequest)
        let dict = createPaymentNewRequest.toJSON()
        print("***************Single Vendor Charge API Request******************")
        print(dict)

        payment.makePostCall(backFleg:true,headerToken:strApiToken,paymentDetails: createPaymentNewRequest, controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
            print("***************Single Vendor Charge API Response******************")
                print(response)
               let responseDict = response.transectionDetails.toJSON()
                print(responseDict["refund_order_id"] as? String ?? "")
                self.strOrderId = responseDict["refund_order_id"] as? String ?? ""
                print(self.strOrderId)// refund_orderid
                //strOrderId = response.transectionDetails[0].o
                self.showAlert(status: response.message , responseMessage: response)
            case .failure(let error):
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
            }
        })
    }
    
    @IBAction func tapToChargeApiBuyMultiProducts(_ sender: Any) {
        print(self.strSrcValue)
        if  self.strWhiteListStatus == "2" {
            strApiType = "2"
            showPaymentTypeDropDown()
        }
        else {
           
            self.multiChargeApi()
        }
    }
    
    func multiChargeApi() {
        let product: Product = Product(name: "Logitech K380", description: "Logitech K380 / Easy-Switch for Upto 3 Devices, Slim Bluetooth Tablet Keyboard ", price: 1, quantity: 1)
        let product1: Product = Product(name: "2-Logitech K380", description: "Logitech K380 / Easy-Switch for Upto 3 Devices, Slim Bluetooth Tablet Keyboard ", price: 1, quantity: 1)
        var products = [Product]()
        products.append(product)
        products.append(product1)
        
        //let extraMerchantDatum : ExtraMerchantData = ExtraMerchantData(
        let extraMerchantData : ExtraMerchantDatum = ExtraMerchantDatum(amount: 10,knetCharge: 5,knetChargeType: "fixed",ccCharge: 10,ccChargeType: "percentage",ibanNumber: "KW91KFHO0000000000051010173254")
        let extraMerchantData1 : ExtraMerchantDatum = ExtraMerchantDatum(amount: 10,knetCharge: 5,knetChargeType: "fixed",ccCharge: 7,ccChargeType: "percentage",ibanNumber: "KW31NBOK0000000000002010177457")
        var extraMerchantDatum = [ExtraMerchantDatum]()
        extraMerchantDatum.append(extraMerchantData)
        extraMerchantDatum.append(extraMerchantData1)

        let order : Order = Order(id:"202210101255255144669",reference:"11111991" ,description: "Purchase order received for Logitech K380 Keyboard",currency: "KWD",amount: 0.100)
        let payGateway : PaymentGateway = PaymentGateway(src: self.strSrcValue)
        let strCustomerUnique = UserDefaults.standard.string(forKey: "customerUnique")
        let token : Tokens = Tokens(kFast: "",creditCard: "",customerUniqueToken: strCustomerUnique)
        let ref : Reference = Reference(id: "202210101202210101")
        let customer : Customer = Customer(uniqueID: "2129879kjbljg767881",name: "Jhon Smith",email: "jhon.smith@upayments.com",mobile: "+96512345678")
        let plugin : Plugin = Plugin(src: "magento")
        let browserDetail : BrowserDetails = BrowserDetails(screenWidth: "1920",screenHeight: "1080",colorDepth: "24",javaEnabled: "true",language: "en", timeZone: "-180")
        let device : Device = Device(browser: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0",browserDetails: browserDetail)
        let createPaymentNewRequest = CreatePaymentRequest(product: products, extraMerchantData:extraMerchantDatum, sessionID: "", isTest: true, order: order, paymentGateway: payGateway, notificationType: "all", language: "en", isSaveCard: false, isWhitelabled: true, tokens: token, reference: ref, customer: customer, plugin: plugin, customerExtraData: "test data", returnURL: "https://upayments.com/en/", cancelURL: "https://www.error.com", notificationURL: "https://webhook.site/ce503866-6bb3-4c58-a2f2-a0fa028f10ea", device: device)
        
        let dict = createPaymentNewRequest.toJSON()
        print("***************Multiple Vendor Charge API Request******************")
        print(dict)

        payment.makePostCall(backFleg:true,headerToken:strApiToken,paymentDetails: createPaymentNewRequest, controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                print("***************Multiple Vendor Charge API Respose******************")
                print(response)
               let responseDict = response.transectionDetails.toJSON()
                self.strOrderId = responseDict["refund_order_id"] as? String ?? ""
                //print(orderId)
                //strOrderId = response.transectionDetails[0].o
                self.showAlert(status: response.message , responseMessage: response)
            case .failure(let error):
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
            }
        })
    }
    @IBAction func tapToGenerateInvoice(_ sender : UIButton) {
        let createInvoiceDict = ["cancelUrl":"https://developers.upayments.com/","customer":["email":"Aqeel2@gmail.com","mobile":"69923183","name":"Aqeel2","uniqueId":"ABCDer22126433"],"customerExtraData":"","isSaveCard":false,"isTest":false,"is_whitelabled":false,"language":"en","extraMerchantData":[],"notificationType":"email","notificationUrl":"https://webhook.site/92eb6888-362b-4874-840f-3fff620f7cf4","order":["amount":19.98,"currency":"USD","description":"Order Description","id":"123","reference":"REF-456"],"paymentGateway":["src":"create-invoice"],"plugin":["src":"magento"],"product":[["description":"Product 1","name":"KFS","price":10.0,"qty":1],["description":"","name":"KFS2","price":20.0,"qty":1]],"reference":["id":"123459865234889"],"returnUrl":"https://upayments.com/en/","sessionId":"","tokens":["creditCard":"","customerUniqueToken":"69923183","kFast":""]] as [String:Any]
        print("***************Generate Invoice API Request******************")
        print(createInvoiceDict)
        payment.createInvoiceApi(headerToken: strApiToken, createInvoicexRequest: createInvoiceDict, controller: self, completionHandler:{(result) in
            switch result{
            case .success(let response):
                print("***************Generate Invoice API Response******************")
                print(response)
                self.showAlert(status: "" , responseMessage: response)
                //print(response.transectionDetails)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
                
            }
        })
    }
    
    @IBAction func tapToSingleRefund(_ sender : UIButton) {
        self.tapToPerformRefund()
    }
    
    @IBAction func tapToMultiRefund(_ sender : UIButton) {
        self.tapToPerformRefund()
    }
    
    func tapToPerformRefund() {
        if self.strOrderId == "" {
            self.strOrderId = "mv1GZnrG2l2022101012552551446691695574999154823088265106bd73328c"
        }
        let dict = ["orderId" : self.strOrderId, "totalPrice" : 1.0,"customerFirstName":"Jhon","customerEmail":"jhon@upayment.com","customerMobileNumber":"+96512345678","reference":"11223344","notifyUrl": "https://upayments.com/en"] as [String : Any]
       
        print("***************Single Vendor Refund API Request******************")
        print(dict)
        print(strApiToken)
        payment.getRefundDetails(headerToken:strApiToken,refundRequest: dict, controller: self, completionHandler:{(result) in
            switch result{
            case .success(let response):
                print("***************Single Vendor Refund API Response******************")
                print(response)
                let responseDict = response["data"] as? [String:Any]
                let responseMsg = response["message"] as? String
                let isMultivendorRefund = responseDict?["isMultivendorRefund"] as? Int
                if isMultivendorRefund == 1 {
                    let orderId = responseDict?["orderId"] as? String
                    if var refundPayload = responseDict?["refundPayload"] as? [[String:Any]] {
                        self.tapToGetMultipleRefundDetails(strOrderId: orderId ?? "", arrPayloadData: refundPayload)
                    }
                    else {
                        self.showAlert(status: responseMsg ?? "", responseMessage: response)
                    }
                }
                else {
                   
                    self.strSingleDeleteOrderId = responseDict?["orderId"] as? String ?? ""
                    self.strSingleDefundOrderId = responseDict?["refundOrderId"] as? String ?? ""
                    print(self.strSingleDeleteOrderId)
                    print(self.strSingleDefundOrderId)
                    self.showAlert(status: responseMsg ?? "", responseMessage: response)
                }
                //print(response.transectionDetails)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
                
            }
        })
    }
    func tapToGetMultipleRefundDetails(strOrderId:String,arrPayloadData:[[String:Any]]) {
        var arrUpdatedPayloadData : [[String:Any]] = [[String:Any]]()
        for item in arrUserEnterMultiRefaundData.enumerated() {
                for var items in arrPayloadData {
                    if item.element["ibanNumber"] == items["ibanNumber"] as? String {
                        let amountToRefund = item.element["amountToRefund"]
                        items["amountToRefund"] = amountToRefund

                        arrUpdatedPayloadData.append(items)

                    } else {
                       // self.finalDictionary2.append(items)
                    }
                }
            }
        print(arrUpdatedPayloadData)
        let requestDict = ["orderId": "mv1GZnrG2l20221010125525514466916952338992027231147650b376b24b0c",
                           "refundPayload": arrUpdatedPayloadData,
                           "receiptId": "NHDBC55214",
                           "customerFirstName": "Jhon Smith",
                           "customerEmail": "jhonsmith@upayments.com",
                           "customerMobileNumber": "+96512345678",
                           "reference": "HCNHD1425KSM",
                           "notifyUrl": "https://upayments.com"
        ] as [String : Any]
        print("***************Multi Vendor Refund API Request******************")
        print(requestDict)
        print(strApiToken)
        payment.getMultipleRefundDetails(headerToken: strApiToken, multipleRefundRequest: requestDict, controller: self, completionHandler:{(result) in
            switch result{
            case .success(let response):
                print("***************Multi Vendor Refund API Response******************")
                print(response)
                let responseMsg = response["message"] as? String
                self.showAlert(status: "", responseMessage: response)
                let responseDict = response["data"] as? [String:Any]
                let responseDataDict = responseDict?["responseData"] as? [String:Any]
                let arrGenerated = responseDataDict?["generated"] as? [[String:AnyObject]]
                if arrGenerated?.count ?? 0 > 0 {
                    let dataDict = arrGenerated?[0] as? [String:Any]
                    self.strMultiDeleteRefundInvoiceId = dataDict?["generatedInvoiceId"] as? String ?? ""
                    self.strMultiDeleteOrderId = dataDict?["orderId"] as? String ?? ""
                    self.strMultiDeleteRefundArn = dataDict?["refundArn"] as? String ?? ""
                    self.strMultiDeleteRefundOrderId = dataDict?["refundOrderId"] as? String ?? ""
                    print(self.strMultiDeleteOrderId)
                    print(self.strMultiDeleteRefundOrderId)
                    print(self.strMultiDeleteRefundArn)
                    print(self.strMultiDeleteRefundOrderId)
                   
                }
               
                //print(response.transectionDetails)
                break
            case .failure(let error):
                self.showAlert(status: "", responseMessage: error.localizedDescription)
                print(error.localizedDescription)
                break

            }
        })
    }
    
    @IBAction func tapToSingleDeleteRefund(_sender : UIButton) {
        singleDeleteRefund()
    }
    @IBAction func tapToMultiDeleteRefund(_sender : UIButton) {
        //singleDeleteRefund()
        self.multiDeleteRefund()
    }
     
    func singleDeleteRefund() {
        //let deleteRefundDict = ["orderId": self.strSingleDeleteOrderId,"refundOrderId":self.strSingleDefundOrderId] as [String:Any]
        let deleteRefundDict = ["orderId": self.strSingleDeleteOrderId,"refundOrderId":self.strSingleDefundOrderId] as [String:Any]
        //let deleteRefundDict = ["orderId": "mv1GZnrG2l2022101012552551446691695574999154823088265106bd73328c","refundOrderId":"bakh50J2nvElhunbBpIsMGQ3vKuEcji2"] as [String:Any]
        print("***************Single Vendor Delete Refund API Request******************")
        print(deleteRefundDict)
        print(strApiToken)
        payment.deleteRefundApi(headerToken: strApiToken, deleteRefundRequest: deleteRefundDict, controller: self, completionHandler:{(result) in
            switch result{
            case .success(let response):
                print("***************Single Vendor Delete Refund API Response******************")
                print(response)
                self.showAlert(status: "", responseMessage: response)
                //print(response.transectionDetails)
                break
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(status: "", responseMessage: error.localizedDescription)
                break
                
            }
        })
    }
    
    
    func multiDeleteRefund() {
//        let deleteMultiVenderRefundDict = [
//            "orderId": "k4eJmnNR8pME3OdxVO6m2022101012552551446691692649169166362476564e3c6d1d9f2dS6vVM4Bcjna2jiP4yNdXUP6j55UKXPgd",
//            "refundPayload": [
//                [
//                    "amountToRefund" : 0,
//                    "ibanNumber" : "KW91KFHO0000000000051010173254",
//                    "merchantType" : "vendor",
//                    "refundRequestId" : "MFp6N0thMHk5Sw==",
//                    "refundedAmount" : 0,
//                    "remainingLimit" : 10,
//                    "totalPaid" : "10.000"
//                ],
//                [
//                    "amountToRefund" : 0,
//                    "ibanNumber" : "KW31NBOK0000000000002010177457",
//                    "merchantType" : "vendor",
//                    "refundRequestId" : "TUxEMGcxcGxMcA==",
//                    "refundedAmount" : 0,
//                    "remainingLimit" : 10,
//                    "totalPaid" : "10.000"
//                ]
//            ],
//            "receiptId": "NHDBC55214",
//            "customerFirstName": "Jhon Smith",
//            "customerEmail": "jhonsmith@upayments.com",
//            "customerMobileNumber": "+96512345678",
//            "reference": "HCNHD1425KSM",
//            "notifyUrl": "https://upayments.com"
//        ] as [String:Any]
        let deleteMultiVenderRefundDict = ["generatedInvoiceId": self.strMultiDeleteRefundInvoiceId,"orderId":self.strMultiDeleteOrderId,"refundArn":self.strMultiDeleteRefundArn,"refundOrderId":self.strMultiDeleteRefundOrderId] as [String:Any]
        //let deleteMultiVenderRefundDict = ["generatedInvoiceId": "ZUptTlhHZDdSOA==","orderId":"Zl1a64XJx3Zl1a64XJx3mv1GZnrG2l20221010125525514466916952338992027231147650b376b24b0cCH78AT5tg2Q0TOeMZWzRFFhHhmumF7k1Fql0Q3UcMEJNYFjnlGtPGwQhaftBkpr8","refundArn":"0qVIkGFMJu2QHpZwMUDVtWMd7JGvhqc3","refundOrderId":"Fql0Q3UcMEJNYFjnlGtPGwQhaftBkpr8"] as [String:Any]
        print("***************Multi Vendor Delete Refund API Request******************")
        print(deleteMultiVenderRefundDict)
        payment.deleteMultiVendorRefundApi(headerToken: strApiToken, deleteMultiVenderRefundRequest: deleteMultiVenderRefundDict, controller: self, completionHandler:{(result) in
            switch result{
            case .success(let response):
                print("***************Multi Vendor Delete Refund API Response******************")
                print(response)
                self.showAlert(status: "", responseMessage: response)
                //print(response.transectionDetails)
                break
            case .failure(let error):
                self.showAlert(status: "", responseMessage: error.localizedDescription)
               
                break
                
            }
        })
    }
    @IBAction func tapToCreateToken(_ sender: UIButton) {
        createNewToken()
    }
    func createNewToken() {
        let token = (Int(generateRandomDigits(10)))
        let generateTokenReqModel = GenerateTokenReqModel(customerUniqueToken: token?.description)
        print("***************Create Token API Request******************")
        print(generateTokenReqModel.toJSON())
        payment.createTokenPostCall(headerToken: strApiToken,tokenDetails: generateTokenReqModel , controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                print("***************Create Token API Response******************")
                print(response)
                self.showAlert(status: response.message ?? "", responseMessage: response)
                self.customerUnique = String(response.data?.customerUniqueToken ?? 0)
                UserDefaults.standard.set(self.customerUnique, forKey: "customerUnique")
                print(self.customerUnique)
            case .failure(let error):
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
            }
        })
    }
    func generateRandomDigits(_ digitNumber: Int) -> String {
        var number = ""
        for i in 0..<digitNumber {
            var randomNumber = arc4random_uniform(10)
            while randomNumber == 0 && i == 0 {
                randomNumber = arc4random_uniform(10)
            }
            number += "\(randomNumber)"
        }
        return number
    }


    @IBAction func tapToAddCard(_ sender: UIButton) {
        let strCustomerUnique = UserDefaults.standard.string(forKey: "customerUnique") ?? "0"
       let addCardReuest = [
            "card": [
                "number": "5123450000000008",
                "expiry": [
                    "month": "02",
                    "year": "39"
                ],
                "securityCode": "100",
                "nameOnCard": "Dharmendra Kakde"
            ],
            "customerUniqueToken": (Int(strCustomerUnique) ??  0)] as [String:Any]
        print("***************Add Card API Request******************")
        print(addCardReuest)
        payment.addCardDetails(headerToken: strApiToken, addCardRequest: addCardReuest, controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                print("***************Add Card API Response******************")
                print(response)
                self.showAlert(status: "", responseMessage: response)
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
                
            }
        })
    }
    
    @IBAction func tapToRetriveCard(_ sender: UIButton) {
        let strCustomerUnique = UserDefaults.standard.string(forKey: "customerUnique") ?? "0"
        let retreiveCardRequest = [
        "customerUniqueToken" : (Int(strCustomerUnique) ??  0)
        ]
        print("***************Retrieve Card API Request******************")
        print(retreiveCardRequest)//2363800481
        payment.retriveCardDetails(headerToken:strApiToken, retCardDetReq: retreiveCardRequest, controller: self, completionHandler:  {(result) in
            switch result{
            case .success(let response):
                print("***************Retrieve Card API Response******************")
                print(response)
                self.showAlert(status: "", responseMessage: response)
            case .failure(let err):
                print(err.localizedDescription)
                self.showAlert(status: String(err.httpStatusCode ?? 0), responseMessage: err.reason ?? "")
            }
        })
    }
    
    
    @IBAction func payStatus(_ sender: Any) {
        payment.getCheckPaymentStatus(headerToken: strApiToken,strTrackId: "202305505718076761984557261163", controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                print(response)
                self.showAlert(status: response.message ?? "", responseMessage: response)
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(status: String(error.httpStatusCode ?? 0), responseMessage: error.reason ?? "")
            }
        })
    }
    

   func showPaymentTypeDropDown() {
         DispatchQueue.main.async {
             self.viewShowDropDown.isHidden = false
         
        let dropdown = DropDown()
        dropdown.direction = .bottom
        dropdown.cellHeight = 40
        dropdown.anchorView = self.viewShowDropDown
        dropdown.dataSource = self.arrPaymentButton
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.paymentTypeTxt?.text = self.arrPaymentButton[index]
            let paymentType = self.arrPaymentButton[index].split(separator: "_")
            debugPrint(paymentType)
            var paymentVal = ""
            if paymentType.count == 2{
                paymentVal = "\(paymentType[0])-\(paymentType[1])"
            }else{
                paymentVal = "\(paymentType[0])"
            }

            if paymentVal == "credit-card"{
                self.strSrcValue = "cc"
            }else{
                self.strSrcValue = paymentVal
            }
            dropdown.bottomOffset = CGPoint(x: 0, y:(((self.viewShowDropDown?.frame.origin.y)!) + ((self.viewShowDropDown?.frame.size.height)!)))
            viewShowDropDown.isHidden = true
            if strApiType == "1" {
                self.singleChargeApi()
            }
            else if strApiType == "2" {
                self.multiChargeApi()
            }
            
        }
        dropdown.show()
        }
    }
    
    private func showAlert<T>(status: String, responseMessage: T){
         DispatchQueue.main.async {
             let alertController = UIAlertController(title: "\(status)", message:
                                                         "\(responseMessage)", preferredStyle: .alert)
             alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
             self.present(alertController, animated: true, completion: nil)
         }
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
