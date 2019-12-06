//
//  ChatViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

class ChatViewModel {
    
    func getUsers(didFinishWithSuccess: @escaping ((User) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.fetchUsers(didFinishWithSuccess: { (result) in
            didFinishWithSuccess(result)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
}
