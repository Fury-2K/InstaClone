//
//  APIClient.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import Alamofire
import FirebaseAuth
import FirebaseDatabase

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
    
    static func fetchUsers(didFinishWithSuccess: @escaping (([User]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.loadData(fetch: "users", eventType: .value, didFinishWithSuccess: { (users) in
            let allUsers = users.compactMap { element -> User? in
                guard let user = element.value as? [String : Any],
                    let username = user["username"] as? String,
                    let email = user["email"] as? String,
                    let profileImg = user["profileImage"] as? String
                    else { return nil }
                let uid = element.key
                guard let currentUser = UserDefaults.standard.value(forKey: "currentUser")as? User else { return nil }
                if uid == currentUser.uid { return nil }
                return User(username: username, name: email, profileImgUrl: profileImg, uid: uid)
            }
            didFinishWithSuccess(allUsers)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error.description)
        }
    }
    
    static func fetchMessages(didFinishWithSuccess: @escaping ((Message) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.loadData(fetch: "messages", eventType: .childAdded, didFinishWithSuccess: { (messages) in
            if let toId = messages["toId"] as? String,
                let fromId = messages["fromId"] as? String,
                let text = messages["data"] as? String,
                let timeStamp = messages["timeStamp"] as? Int {
                didFinishWithSuccess(Message(toId: toId, fromId: fromId, text: text, timeStamp: timeStamp))
            }
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error.description)
        }
    }
    
    static func fetchAllMessages(didFinishWithSuccess: @escaping (([Message]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.loadData(fetch: "messages", eventType: .value, didFinishWithSuccess: { (messages) in
            var allMessages: [Message] = []
            for (_, value) in messages {
                guard let message = value as? [String: Any],
                    let toId = message["toId"] as? String,
                    let fromId = message["fromId"] as? String,
                    let text = message["data"] as? String,
                    let timeStamp = message["timeStamp"] as? Int
                    else {continue}
                allMessages.append(Message(toId: toId, fromId: fromId, text: text, timeStamp: timeStamp))
            }
            didFinishWithSuccess(allMessages)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error.description)
        }
    }
    
    static func loadData(fetch child: String, eventType: DataEventType, didFinishWithSuccess: @escaping (([String: Any]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        let ref = Database.database().reference().child(child)
        ref.observe(eventType, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
               didFinishWithSuccess(dictionary)
            } else { didFinishWithError(111,"NetworkCall successful but datafetching failed") }
        }) { (error) in
            let error = error as NSError
            didFinishWithError(error.code, error.description)
        }
    }
    
    static func sendMessage(_ message: String, to user: User) {
        let ref = Database.database().reference().child("messages")
        let childRef = ref.childByAutoId()
        guard let currentUser = UserDefaults.standard.value(forKey: "currentUser")as? User else { return }
        let fromId = currentUser.uid
        let toId =  user.uid
        let timeStamp: Int = Int(NSDate().timeIntervalSince1970)
        let values: [String: Any] = [
            "toId": toId,
            "fromId": fromId,
            "data": message,
            "timeStamp": timeStamp
            ]
        childRef.updateChildValues(values)
    }
}
