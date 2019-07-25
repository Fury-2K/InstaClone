//
//  ChatViewCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 23/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
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
    
    
    func setData(_ cellData: FeedData) {
        self.nameLabel.text = String(cellData.firstName + " " + cellData.lastName)
        self.chatPreviewLabel.text = cellData.email
        self.dp.downloaded(from: cellData.dp[2])
        self.cameraImageView.image = UIImage(named: "camera-7")
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
