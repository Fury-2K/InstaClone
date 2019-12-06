//
//  HeaderCollectionCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 24/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class HeaderCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
        self.imageView.clipsToBounds = true
        self.imageView.layer.borderWidth = 2
        self.imageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.borderView.layer.cornerRadius = self.borderView.frame.width / 2
        self.borderView.clipsToBounds = true
    }

    func setData(_ cellData: FeedData) {
        self.imageView.downloaded(from: cellData.feedPics[2])
        self.userLabel.text = cellData.firstName
    }
    
}
