//
//  ChatViewCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 23/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class ChatViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.dp.layer.cornerRadius = self.dp.frame.height / 2
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var chatPreviewLabel: UILabel!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    
    func setData(_ cellData: UserData) {
        nameLabel.text = cellData.user.name
        chatPreviewLabel.text = cellData.messages.last?.text
        dp.downloadImage(fromUrl: cellData.user.profileImgUrl)
        cameraImageView.image = UIImage(named: "camera-7")
    }
    
}
