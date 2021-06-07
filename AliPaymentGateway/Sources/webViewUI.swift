//
//  webViewUI.swift
//  AliPaymentGateway
//
//

import UIKit
import WebKit

class webViewUI: UIView {


  var mWebView: WKWebView = {
    let wView = WKWebView()
    wView.translatesAutoresizingMaskIntoConstraints = false
    wView.allowsLinkPreview = true
    wView.allowsBackForwardNavigationGestures = true
    return wView
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .white
      addSubview(mWebView)

    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    private func setupConstraints() {
        self.mWebView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        self.mWebView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        self.mWebView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        self.mWebView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    }

}
