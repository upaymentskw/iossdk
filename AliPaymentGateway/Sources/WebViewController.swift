//
//  WebViewcontroller.swift
//  AliPaymentGateway
//
//


import UIKit
import WebKit

public class WebViewController: UIViewController {
    
    public var completionHandler : ((_ response: PaymentResponse) -> Void)?
    public var url = URL(string: "")
    private var webUi: webViewUI = webViewUI()
    var paymentParameter:paymentDetailsData?

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.webUi.mWebView.navigationDelegate = self
        let request = URLRequest(url: self.url!)
        self.webUi.mWebView.load(request)
    }
    
    public override func loadView() {
      view = webUi
    }

}


extension WebViewController: WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("page finished load")
    }
    
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation: \(navigation.debugDescription)")
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url?.absoluteString {
            if url.contains((paymentParameter?.success_url)!) || url.contains((paymentParameter?.errorUrl)!)
            {
                decisionHandler(.cancel)
                self.dismiss(animated: true) {
                    self.completionHandler?(self.ParsingString(split: navigationAction.request.url?.absoluteString.split(usingRegex: "\\?") ?? [] ))
                       }
            }
            else{
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.allow)
        }
    }
    func ParsingString(split:[String]) ->PaymentResponse {

        let split1 = split[1].split(usingRegex: "\\&")
        print(split1.description)
        var dict = [String : String]()

        for (index, element) in split1.enumerated() {
            let split2: [String] = element.split(usingRegex: "=")
            if (!split2.isEmpty) {
                dict[split2[0]] = split2[1].replacingOccurrences(of: "%20", with: "", options: [.regularExpression])
            }
          print("Item \(index): \(element)")
        }
        var completedTrancestionDetails = Transaction_Details()
        completedTrancestionDetails.paymentID = dict["PaymentID"] ?? ""
        completedTrancestionDetails.result = dict["Result"] ?? ""
        completedTrancestionDetails.postDate = dict["PostDate"] ?? ""
        completedTrancestionDetails.tranID = dict["TranID"] ?? ""
        completedTrancestionDetails.ref = dict["Ref"] ?? ""
        completedTrancestionDetails.trackID = dict["TrackID"] ?? ""
        completedTrancestionDetails.auth = dict["Auth"] ?? ""
        completedTrancestionDetails.orderID = dict["OrderID"] ?? ""
        completedTrancestionDetails.cust_ref = dict["cust_ref"] ?? ""
        completedTrancestionDetails.trnUdf = dict["trnUdf"] ?? ""

        if completedTrancestionDetails.result == "CAPTURED" {
            return PaymentResponse(message: "payment succeeded", transectionDetails: completedTrancestionDetails)
        }else{
            return PaymentResponse(message: "payment failured", transectionDetails: completedTrancestionDetails)

        }
    }
}
extension String {
    func split(usingRegex pattern: String) -> [String] {
        //### Crashes when you pass invalid `pattern`
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(0..<utf16.count))
        let ranges = [startIndex..<startIndex] + matches.map{Range($0.range, in: self)!} + [endIndex..<endIndex]
        return (0...matches.count).map {String(self[ranges[$0].upperBound..<ranges[$0+1].lowerBound])}
    }
    

}
