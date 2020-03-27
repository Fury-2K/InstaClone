//
//  UIImageView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 03/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

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
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    /// Download image from Firebase Storage
    func downloadImage(fromUrl url: String) {
        let storageRef = Storage.storage().reference(forURL: url)
        
        storageRef.getData(maxSize: 1 * 1024 * 1024) { [weak self] (data, error) -> Void in
            if error != nil {
                self?.image = UIImage(named: "circle-user-7")
            }
            guard let data = data,
                let image = UIImage(data: data)
            else {
                self?.image = UIImage(named: "circle-user-7")
                return
            }
            self?.image = image
        }
    }
    
}
