//
//  APIClient.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import Alamofire
import Firebase

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
                let feedData = FeedData(gender, fName, lName, email, urls, uid: "")
                didFinishWithSuccess(feedData)
        }
    }
    
    static func fetchUsers(didFinishWithSuccess: @escaping ((User) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        let ref = Database.database().reference().child("users")
        ref.observe(.value, with: { (snapshot) in
            if let user = snapshot.value as? [String: Any] {
                var allusers : [[String : Any]] = []
                for (key, value) in user{
                    guard let value = value as? [String : Any] else {continue}
                    allusers.append(value)
                }
                print(allusers.count)
                guard let username = user["username"] as? [String : Any],
                    let email = user["email"] as? String else { return }
                let uid = snapshot.key
                didFinishWithSuccess(User(username: "username", name: email, profilePic: nil, uid: uid))
            } else {
                didFinishWithError(2, "Data not Found")
            }
        }) { (error) in
            guard let error = error as? NSError else {return}
            didFinishWithError(error.code, error.description)
        }
    }
    
}
