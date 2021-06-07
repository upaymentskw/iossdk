//
//  ViewController.swift
//  DemoProject
//
//  Created by **** on 15/03/21.
//

import UIKit
import AliPaymentGateway

public protocol viewocntrollerCallback {
    func callBackDetails(value: [String : String])
}

public class ViewController: UIViewController, viewocntrollerCallback {

    public func callBackDetails(value: [String : String]) {
        print("welcome back")
    }


    let payment : AllPaymentStoreUseCase = APGImplementation.shared.allPaymentStoreUseCase
    var userPaymentData : paymentDetailsData = paymentDetailsData()
    @IBOutlet weak var launch: UIButton!


    public override func viewDidLoad() {
        super.viewDidLoad()

        // Add Secrets key for valid project.
        let manager = SecretsManager(key: "12345")
        if let response = manager.readSecret(){
            print(response)
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        print("appeared")
    }


    @IBAction func launchPayment(_ sender: Any) {

        //        MARK:- with Productions Data...
//        userPaymentData.usrname = "upayments_live"
//        userPaymentData.password = "e:X9La]n#eF%n"
//        userPaymentData.apiKey = "aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2"
//        userPaymentData.merchantId = "397"

//                MARK:- with sandbox data
                userPaymentData.usrname = "test"
                userPaymentData.password = "test"
                userPaymentData.apiKey = "jtest123"
                userPaymentData.merchantId = "1201"
                userPaymentData.testMode = "1"

        userPaymentData.testMode = "1"
        userPaymentData.merchantId = "1201"
        userPaymentData.orderId = "123asdwe5678976"
        userPaymentData.totalPrice = "50.0"
        userPaymentData.currencyCode = "KD"
        userPaymentData.success_url = "https://example.com/success.html"
        userPaymentData.errorUrl = "https://example.com/error.html"
        userPaymentData.notifyURL = "https://example.com/notify.html"

        payment.makePostCall(paymentDetails: userPaymentData, Issandbox: true, controller: self, completionHandler: {(result) in
            switch result{
            case .success(let response):
                print(response.message)
                print(response.transectionDetails)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break

            }

        })

    }


}




