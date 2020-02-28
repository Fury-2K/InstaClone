//
//  UserViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 21/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class UserViewModel {
    
    func createUser(_ username: String, _ email: String, _ password: String, _ profileImg: UIImage?, _ name: String, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
        FirebaseService.shared.createUser(username, email, password, profileImg, name, didFinishWithSuccess: { (username, email) in
            didFinishWithSuccess(username, email)
        }) { (error, discription) in
            didFinishWithError(error, discription)
        }
    }
    
    func signInUser(_ email: String, _ password: String, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
        FirebaseService.shared.signInUser(email, password, didFinishWithSuccess: { (username, email) in
            didFinishWithSuccess(username, email)
        }) { (error, discription) in
            didFinishWithError(error, discription)
        }
    }
}
