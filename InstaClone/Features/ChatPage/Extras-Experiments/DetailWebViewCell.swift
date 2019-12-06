//
//  DetailWebViewCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit
import WebKit

protocol ResizeWebCellDelegate {
    func expandCell()
    func collapseCell()
}

class DetailWebViewCell: UITableViewCell {

//    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    var resizeWebCellDelegate: ResizeWebCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toggleSwitch.isOn = false
    }

    @IBAction func toggleExpansion(_ sender: UISwitch) {
        if toggleSwitch.isOn {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
//             webView.load(URLRequest(url: url))
            resizeWebCellDelegate?.expandCell()
            //webView.isHidden = false
        } else {
            resizeWebCellDelegate?.collapseCell()
            //webView.isHidden = true
        }
    }

    
}
