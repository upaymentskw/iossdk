//
//  AllPaymentStoreUseCase.swift
//  AliPaymentGateway
//
//

import Foundation
import WebKit

public protocol AllPaymentStoreUseCase: UseCase {
    // All Methods
    func makePostCall(paymentDetails: paymentDetailsData,Issandbox:Bool, controller:UIViewController,completionHandler:@escaping(Result<PaymentResponse, HUNetworkError>) -> Void) -> Void
}

public class AllPaymentStoreImplementation: NSObject, AllPaymentStoreUseCase {
    
    private let baseUrl : String = "https://api.upayments.com/"
   // private let baseUrl : String = "https://api.upayments.com/"

    public override init() {}
    
    public func makePostCall(paymentDetails: paymentDetailsData,Issandbox:Bool, controller:UIViewController,completionHandler:@escaping(Result<PaymentResponse, HUNetworkError>)  -> Void) -> Void
    {
        var receivedUrl: String = ""
        let url = URL(string: baseUrl + ApiPaths.payment)
        var request = URLRequest(url: url!)
        
        request.setValue(ApiConstants.HeaderValues.jsonContentType, forHTTPHeaderField: ApiConstants.Headers.contentType)
        request.httpMethod = ApiType.post
        request.httpBody = try! JSONSerialization.data(withJSONObject: paymentDetails.toJSON(), options: [.prettyPrinted])
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {completionHandler(.failure(HUNetworkError(reason: error?.localizedDescription, httpStatusCode: 500))); return }
            
            guard let responseData = data else {completionHandler(.failure(HUNetworkError(reason: "Response Nil", httpStatusCode: 400))); return}
            
            do {
                guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,options: []) as? [String: Any] else { return }
                guard let status = receivedTodo["status"] as? String else {completionHandler(.failure(HUNetworkError(reason: "Response Parsing Error", httpStatusCode: 408)));return}

                if status == ResponseStatus.success{
                    if((receivedTodo["paymentURL"]) != nil) {
                        receivedUrl = receivedTodo["paymentURL"] as! String
                        DispatchQueue.main.async {
//                            self.OpenWebPage(urlString: receivedUrl, controller: controller)
                            guard let url =  URL(string: receivedUrl) else {return}
                            let webcontroller = WebViewController()
                            webcontroller.url = url
                            let completionHandler:(_ PaymentResponse:PaymentResponse)->Void = { paymentresponse in
                                completionHandler(.success(paymentresponse))
                            }
                            webcontroller.paymentParameter = paymentDetails
                            webcontroller.completionHandler = completionHandler
                            webcontroller.navigationController?.isNavigationBarHidden = true
                            controller.present(webcontroller, animated: true, completion: nil)

                        }
                    }
                }else if status == ResponseStatus.failure {
                    completionHandler(.failure(HUNetworkError(reason: receivedTodo["error_msg"] as? String, httpStatusCode: 408)))
//                    print(receivedTodo["error_msg"] as? String ?? "Error!!")
                }

            } catch { return }
        }
        task.resume()
        
    }
    func OpenWebPage(urlString:String,controller:UIViewController) {

    }
}




