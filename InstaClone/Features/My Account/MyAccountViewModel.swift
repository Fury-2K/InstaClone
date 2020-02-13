//
//  MyAccountViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 12/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import FirebaseStorage

class MyAccountViewModel {
    
    
    // FIXME: - Change this to use coreData
    func getCurrentUserData() -> User {
        guard let user = UserDefaults.standard.value(forKey: "currentUser") as? User
            else { return User() }
        return User(username: user.username, name: user.username, profileImgUrl: user.profileImgUrl, uid: user.uid)
    }
    
    func downloadImage(fromUrl url: String, didFinishWithSuccess: @escaping ((UIImage) -> Void), didFinishWithError: @escaping ((String) -> Void)) {
        let storageRef = Storage.storage().reference(forURL: url)
        
        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if let error = error {
                didFinishWithError(error.localizedDescription)
            }
            guard let data = data,
                let image = UIImage(data: data)
            else {
                didFinishWithSuccess(UIImage())
                return
            }
            didFinishWithSuccess(image)
        }
    }
}
