//
//  BoxViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 07/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit
import WebKit

/// This controller has a WKWebView on which intercepting an action and allow notification is used
class BoxViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var bottomView: UIView!
    
    let htmlCode: String = "<html><body><a class=\"yourButton\" href=\"inapp://capture\">Change Color</a></body></html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        webView.navigationDelegate = self
    }
    
    func setupWebView() {
        webView.loadHTMLString(htmlCode, baseURL: nil)
    }
}

extension BoxViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url {
            if urlStr.scheme == "inapp" {
                if urlStr.host == "capture" {
                    bottomView.backgroundColor = .red
                }
            }
        }
        decisionHandler(.allow)
    }
}
