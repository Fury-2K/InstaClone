//
//  FirebaseService.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit
//import Alamofire
//import FirebaseAuth
//import FirebaseDatabase
//import FirebaseStorage

class FirebaseService {
    
    public static var shared : FirebaseService = FirebaseService()
    
    // --------------------------
    // MARK:- Dummy API calls for the FeedView
    // --------------------------
    
    func getUserData(didFinishWithSuccess: @escaping ((FeedData) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        let url = "https://randomuser.me/api/"
        let request = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard error != nil else {
                didFinishWithError(404, "Random User Failed")
                return
            }
            
            guard let payload = data as? [String: Any],
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
        request.resume()
//        
//        Alamofire.request(url)
//            .responseJSON { response in
//                guard let data = response.result.value,
//                    let payload = data as? [String: Any],
//                    let result = payload["results"] as? [Any],
//                    let results = result[0] as? [String: Any],
//                    let gender = results["gender"] as? String,
//                    let name = results["name"] as? [String: Any],
//                    let fName = name["first"] as? String,
//                    let lName = name["last"] as? String,
//                    let email = results["email"] as? String,
//                    let pictures = results["picture"] as? [String: Any],
//                    let url1 = pictures["large"] as? String,
//                    let url2 = pictures["medium"] as? String,
//                    let url3 = pictures["thumbnail"] as? String else {
//                        didFinishWithError(404, "error")
//                        return
//                }
//                let urls: [String] = [url1, url2, url3]
//                let feedData = FeedData(gender, fName, lName, email, urls, uid: "")
//                didFinishWithSuccess(feedData)
//        }
    }
    
    // --------------------------
    // MARK:- Fetch data calls
    // --------------------------
    
    func fetchUsers(didFinishWithSuccess: @escaping (([User]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
//        loadData(fetch: "users", eventType: .value, didFinishWithSuccess: { (users) in
//            let allUsers = users.compactMap { element -> User? in
//                guard let user = element.value as? [String : Any],
//                    let username = user["username"] as? String,
//                    let email = user["email"] as? String,
//                    let profileImg = user["profileImage"] as? String,
//                    let name = user["name"] as? String
//                    else { return nil }
//                let uid = element.key
//                guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid")as? String else { return nil }
//                if uid == currentUserUid { return nil }
//                return User(username: username, name: name, profileImgUrl: profileImg, uid: uid, email: email)
//            }
//            didFinishWithSuccess(allUsers)
//        }) { (errorCode, error) in
//            didFinishWithError(errorCode, error.description)
//        }
        didFinishWithSuccess([
            User(username: "Username1", name: "name1", profileImgUrl: "", uid: "001", email: "test@test.com")
        ])
    }
    
    func fetchMessages(didFinishWithSuccess: @escaping ((Message) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
//        loadData(fetch: "messages", eventType: .childAdded, didFinishWithSuccess: { (messages) in
//            if let toId = messages["toId"] as? String,
//                let fromId = messages["fromId"] as? String,
//                let text = messages["data"] as? String,
//                let timeStamp = messages["timeStamp"] as? Int {
//                didFinishWithSuccess(Message(toId: toId, fromId: fromId, text: text, timeStamp: timeStamp))
//            }
//        }) { (errorCode, error) in
//            didFinishWithError(errorCode, error.description)
//        }
        didFinishWithSuccess(Message(toId: "001", fromId: "002", text: "text", timeStamp: 123))
    }
    
    func fetchAllMessages(didFinishWithSuccess: @escaping (([Message]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
//        loadData(fetch: "messages", eventType: .value, didFinishWithSuccess: { (messages) in
//            var allMessages: [Message] = []
//            for (_, value) in messages {
//                guard let message = value as? [String: Any],
//                    let toId = message["toId"] as? String,
//                    let fromId = message["fromId"] as? String,
//                    let text = message["data"] as? String,
//                    let timeStamp = message["timeStamp"] as? Int
//                    else {continue}
//                allMessages.append(Message(toId: toId, fromId: fromId, text: text, timeStamp: timeStamp))
//            }
//            didFinishWithSuccess(allMessages)
//        }) { (errorCode, error) in
//            didFinishWithError(errorCode, error.description)
//        }
        didFinishWithSuccess([
            Message(toId: "001", fromId: "002", text: "text", timeStamp: 123)
        ])
    }
    
    /// Private func to fetch data depending on the type
    /// - Parameters:
    ///   - child: Data type to be fetched
    ///   - eventType: EventType
    ///   - didFinishWithSuccess: Success callback
    ///   - didFinishWithError: Failure callback
//    private func loadData(fetch child: String, eventType: DataEventType, didFinishWithSuccess: @escaping (([String: Any]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
//        let ref = Database.database().reference().child(child)
//        ref.observe(eventType, with: { (snapshot) in
//            if let dictionary = snapshot.value as? [String: Any] {
//                didFinishWithSuccess(dictionary)
//            } else { didFinishWithError(111,"NetworkCall successful but datafetching failed") }
//        }) { (error) in
//            let error = error as NSError
//            didFinishWithError(error.code, error.description)
//        }
//    }
    
    // --------------------------
    // MARK:- Post data
    // --------------------------
    
    func sendMessage(_ message: String, to user: User) {
//        let ref = Database.database().reference().child("messages")
//        let childRef = ref.childByAutoId()
//        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid")as? String else { return }
//        let fromId = currentUserUid
//        let toId =  user.uid
//        let timeStamp: Int = Int(NSDate().timeIntervalSince1970)
//        let values: [String: Any] = [
//            "toId": toId,
//            "fromId": fromId,
//            "data": message,
//            "timeStamp": timeStamp
//        ]
//        childRef.updateChildValues(values)
    }
    
    // --------------------------
    // MARK:- Sign-In/ Sign-Up
    // --------------------------
    
    func createUser(_ username: String, _ email: String, _ password: String, _ profileImg: UIImage?, _ name: String, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
//        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//            if let error = error {
//                didFinishWithError("Registration Failed", error.localizedDescription)
//                return
//            }
//            guard let uid = result?.user.uid else { return }
//            
//            let storageRef = Storage.storage().reference(forURL: "gs://instaclone-10221.appspot.com").child("profile_image").child(uid)
//            if let image = profileImg, let imageData = image.jpegData(compressionQuality: 0.1) {
//                storageRef.putData(imageData, metadata: nil) { (metaData, error) in
//                    if let error = error {
//                        didFinishWithError("Failed to upload imageData", error.localizedDescription)
//                        return
//                    }
//                    
//                    storageRef.downloadURL { (url, error) in
//                        if let error = error {
//                            didFinishWithError("Download Failed", error.localizedDescription)
//                            return
//                        }
//                        
//                        guard let profileImgUrl = url?.absoluteString else {
//                            didFinishWithError("Alert", "Invalid URL")
//                            return
//                        }
//                        UserDefaults.standard.set(uid, forKey: "currentUserUid")
//                        UserData.saveUserData(username: username, email: email, profileImgUrl: profileImgUrl, uid: uid, name: name)
//                        
//                        let values: [String: Any] = ["email": email, "name": name, "username": username, "profileImage": profileImgUrl]
//                        Database.database().reference().child("users").child(uid).setValue(values) { (error, ref) in
//                            if let error = error {
//                                didFinishWithError("Database updation Failed", error.localizedDescription)
//                                return
//                            }
//                            didFinishWithSuccess(username, email)
//                        }
//                    }
//                }
//            }
//        }
        UserDefaults.standard.set("001", forKey: "currentUserUid")
        UserData.saveUserData(username: username, email: email, profileImgUrl: "profileImgUrl", uid: "001", name: "name1")
        didFinishWithSuccess("username", "email")
    }
    
    func signInUser(_ email: String, _ password: String, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            if let error = error {
//                didFinishWithError("Login Failed", error.localizedDescription)
//                return
//            }
//            
//            guard let uid = Auth.auth().currentUser?.uid else { return }
//            Database.database().reference().child("users").child(uid).observe(.value) { (snapshot, error) in
//                if error != nil {
//                    didFinishWithError("Alert", error ?? "error404")
//                    return
//                }
//                
//                guard let snapshot = snapshot.value as? [String: Any],
//                    let username = snapshot["username"] as? String,
//                    let profileImgUrl = snapshot["profileImage"] as? String,
//                    let name = snapshot["name"] as? String
//                    else {
//                        didFinishWithError("Alert", error ?? "error404")
//                        return
//                }
//                UserDefaults.standard.set(uid, forKey: "currentUserUid")
//                UserData.saveUserData(username: username, email: email, profileImgUrl: profileImgUrl, uid: uid, name: name)
//                didFinishWithSuccess(email, username)
//            }
//        }
        
        UserDefaults.standard.set("001", forKey: "currentUserUid")
        UserData.saveUserData(username: "username", email: "email", profileImgUrl: "profileImgUrl", uid: "001", name: "name1")
        didFinishWithSuccess("email", "username")
    }
    
    // --------------------------
    // MARK:- My-Account Helper Methods
    // --------------------------
    
    func getCurrentUserData() -> User {
        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid") as? String,
            let user = UserData.getUser(with: currentUserUid) else { return User() }
        
        guard let username = user.username,
            let email = user.email,
            let profileImgUrl = user.profileImgUrl,
            let name = user.name
            else {
                return User()
        }
        return User(username: username, name: name, profileImgUrl: profileImgUrl, uid: currentUserUid, email: email)
    }
    
    func downloadImage(fromUrl url: String, didFinishWithSuccess: @escaping ((UIImage) -> Void), didFinishWithError: @escaping ((String, String) -> Void)) {
//        let storageRef = Storage.storage().reference(forURL: url)
//        
//        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
//            if let error = error {
//                didFinishWithError("Download Failed", error.localizedDescription)
//                return
//            }
//            guard let data = data,
//                let image = UIImage(data: data)
//                else {
//                    didFinishWithSuccess(UIImage(named: "circle-user-7")!)
//                    return
//            }
//            didFinishWithSuccess(image)
//        }
        
        didFinishWithSuccess(UIImage(named: "circle-user-7")!)
    }
}
