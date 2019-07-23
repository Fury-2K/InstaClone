//
//  ChatViewHeader.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 23/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import UIKit

class ChatViewHeader: UICollectionReusableView {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var HeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        self.HeaderLabel.text = "Inbox"
        self.searchField.setIcon(image: UIImage(named: "search-7"), alignment: "left")
        self.searchField.setIcon(image: UIImage(named: "search-7"), alignment: "right")
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
