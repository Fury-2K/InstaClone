//
//  ChatViewHeader.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 23/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

protocol ToggleSettingsDelegate: class {
    func toggleSettings()
}

class ChatViewHeader: UICollectionReusableView {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var HeaderLabel: UILabel!
    
    weak var toggleSettingsDelegate: ToggleSettingsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        self.HeaderLabel.text = "Inbox"
        self.searchField.setIcon(image: UIImage(named: "search-7"), alignment: .left)
        self.searchField.setIcon(image: UIImage(named: "gear-7"), alignment: .right)
        searchField.rightView?.addTapGesture(#selector(openSettings), target: self)
    }
    
    @objc func openSettings() {
        toggleSettingsDelegate?.toggleSettings()
    }
}
