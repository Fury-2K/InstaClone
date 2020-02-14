//
//  UserViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 21/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class UserViewModel {
    
    func createUser(_ username: String, _ email: String, _ password: String, _ profileImg: UIImage?, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                didFinishWithError(String("Failed to sign User: " + error.localizedDescription))
            }
            guard let uid = result?.user.uid else { return }
            
            let storageRef = Storage.storage().reference(forURL: "gs://instaclone-10221.appspot.com").child("profile_image").child(uid)
            if let image = profileImg, let imageData = image.jpegData(compressionQuality: 0.1) {
                storageRef.putData(imageData, metadata: nil) { (metaData, error) in
                    if let error = error {
                        didFinishWithError(String("Failed to upload imageData " + error.localizedDescription))
                    }
                    
                    storageRef.downloadURL { (url, error) in
                        if let error = error {
                            didFinishWithError(String(error.localizedDescription))
                        }
                        
                        guard let profileImgUrl = url?.absoluteString else {
                            didFinishWithError("Invalid url")
                            return
                        }
                        UserDefaults.standard.set(uid, forKey: "currentUserUid")
                        UserData.saveUserData(username: username, email: email, profileImgUrl: profileImgUrl, uid: uid)
                        
                        let values: [String: Any] = ["email": email, "username": username, "profileImage": profileImgUrl]
                        Database.database().reference().child("users").child(uid).setValue(values) { (error, ref) in
                            if let error = error {
                                didFinishWithError(String("Failed to update database values: " + error.localizedDescription))
                            }
                            didFinishWithSuccess(username, email)
                        }
                    }
                }
            }
        }
    }
    
    func signInUser(_ email: String, _ password: String, didFinishWithSuccess: @escaping ((String, String) -> Void), didFinishWithError: @escaping ((String) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                didFinishWithError("Failed to SignIN: " + error.localizedDescription)
            }
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child("users").child(uid).observe(.value) { (snapshot, error) in
                if error != nil {
                    didFinishWithError(error ?? "error404")
                }
                
                guard let snapshot = snapshot.value as? [String: Any],
                    let username = snapshot["username"] as? String,
                    let profileImgUrl = snapshot["profileImage"] as? String else {
                        didFinishWithError(error ?? "error404")
                        return
                }
                UserDefaults.standard.set(uid, forKey: "currentUserUid")
                UserData.saveUserData(username: username, email: email, profileImgUrl: profileImgUrl, uid: uid)
                didFinishWithSuccess(email, username)
            }
        }
    }
}
