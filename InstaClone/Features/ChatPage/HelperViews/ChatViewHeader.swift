//
//  ChatViewHeader.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 23/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

protocol ToggleSettingsDelegate {
    func toggleSettings()
}

class ChatViewHeader: UICollectionReusableView {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var HeaderLabel: UILabel!
    
    var toggleSettingsDelegate: ToggleSettingsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        self.HeaderLabel.text = "Inbox"
        self.searchField.setIcon(image: UIImage(named: "search-7"), alignment: "left")
        self.searchField.setIcon(image: UIImage(named: "gear-7"), alignment: "right")
        searchField.rightView?.addTapGesture(#selector(openSettings), target: self)
    }
    
    @objc func openSettings() {
        toggleSettingsDelegate?.toggleSettings()
    }
}

extension UITextField {
    
    func setIcon( image: UIImage?, alignment: String) {
        guard let image = image else { return }
        let iconView = UIImageView(frame: CGRect(x: 5, y: 5, width: 18, height: 18))
        iconView.image = image
        let iconContentView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContentView.addSubview(iconView)
        if alignment.lowercased() == "left" {
            leftView = iconContentView
            leftViewMode = .always
        } else {
            rightView = iconContentView
            rightViewMode = .always
        }
    }
}
