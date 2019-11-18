//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    func getData(didFinishWithSuccess: @escaping ((FeedData) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
            APIClient.getUserData(didFinishWithSuccess: { result in
                didFinishWithSuccess(result)
            }, didFinishWithError: { errorCode,error  in
                didFinishWithError(errorCode, error)
            })
    }
    
}
