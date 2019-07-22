//
//  APIClient.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func getUserData(didFinishWithSuccess: @escaping (([FeedData]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        let url = "https://randomuser.me/api/"
        Alamofire.request(url)
            .responseJSON { response in
                if response != nil {
                    print(response)
                    didFinishWithSuccess([FeedData("a", "s", "d", "f", ["g", "h"])])
                } else {
                    didFinishWithError(404, "Cant fetch Shit")
                }
        }
    }
    
}
