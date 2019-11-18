//
//  APIClient.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func getUserData(didFinishWithSuccess: @escaping ((FeedData) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        let url = "https://randomuser.me/api/"
        Alamofire.request(url)
            .responseJSON { response in
                guard let data = response.result.value,
                    let payload = data as? [String: Any],
                    let result = payload["results"] as? [Any],
                    let results = result[0] as? [String: Any],
                    let gender = results["gender"] as? String,
                    let name = results["name"] as? [String: Any],
                        let fName = name["first"] as? String,
                        let lName = name["last"] as? String,
                    let email = results["email"] as? String,
                    let pictures = results["picture"] as? [String: Any],
                    let url1 = pictures["large"] as? String,
                    let url2 = pictures["medium"] as? String,
                    let url3 = pictures["thumbnail"] as? String else {
                        didFinishWithError(404, "error")
                        return
                }
                let urls: [String] = [url1, url2, url3]
                let feedData = FeedData(gender, fName, lName, email, urls)
                didFinishWithSuccess(feedData)
        }
    }
    
}
