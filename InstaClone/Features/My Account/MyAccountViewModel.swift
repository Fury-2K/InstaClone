//
//  MyAccountViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 12/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

class MyAccountViewModel {
    
    func getCurrentUserData() -> User {
        return FirebaseService.shared.getCurrentUserData()
    }
    
    func downloadImage(fromUrl url: String, didFinishWithSuccess: @escaping ((UIImage) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
        FirebaseService.shared.downloadImage(fromUrl: url, didFinishWithSuccess: { (image) in
            didFinishWithSuccess(image)
        }) { (error, discription) in
            didFinishWithError(error, discription)
        }
    }
}
