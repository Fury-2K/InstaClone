//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    func getData() -> [FeedData] {
        let feedData: [FeedData] = []
        APIClient.getUserData(didFinishWithSuccess: { x in
            print(x[0].gender)
        }, didFinishWithError: { errorCode,error  in
            print("\(errorCode) \(error)")
        })
        return feedData
    }
    
}
