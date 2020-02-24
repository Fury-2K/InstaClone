//
//  MyAccountViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 12/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import FirebaseStorage
//import CoreData

class MyAccountViewModel {
    
    func getCurrentUserData() -> User {
        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid") as? String else { return User() }
        let user = UserData.getUser(with: currentUserUid)[0]
        guard let username = user.username,
            let email = user.email,
            let profileImgUrl = user.profileImgUrl else {
                return User()
        }
        return User(username: username, name: email, profileImgUrl: profileImgUrl, uid: currentUserUid)
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
                didFinishWithSuccess(UIImage(named: "circle-user-7")!)
                return
            }
            didFinishWithSuccess(image)
        }
    }
}
