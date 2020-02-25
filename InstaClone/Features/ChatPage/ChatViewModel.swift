//
//  ChatViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

class ChatViewModel {
    
    // --------------------------
    // MARK: - Method to fetch UserMessageDictionary
    // --------------------------
    
    private func getUsers(didFinishWithSuccess: @escaping (([User]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        FirebaseService.shared.fetchUsers(didFinishWithSuccess: { (result) in
            didFinishWithSuccess(result)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    private func getAllMessages(didFinishWithSuccess: @escaping (([Message]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        FirebaseService.shared.fetchAllMessages(didFinishWithSuccess: { (messages) in
            didFinishWithSuccess(messages)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    func getUserMessageDictionary(didFinishWithSuccess: @escaping (([UserDataTemp]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        
        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid") as? String else { return }
        var userDataArray: [UserDataTemp] = []
        
        let getUsers = BlockOperation {
            self.getUsers(didFinishWithSuccess: { (response) in
                userDataArray = response.compactMap({ UserDataTemp(user: $0) })
            }) { (errorCode, error) in
                didFinishWithError(errorCode, error)
            }
        }
        
        let getMessages = BlockOperation {
            self.getAllMessages(didFinishWithSuccess: { (messages) in
                for userData in userDataArray {
                    userData.messages = messages.filter { ($0.toId == userData.user.uid || $0.fromId == userData.user.uid) && ($0.toId == currentUserUid || $0.fromId == currentUserUid) }
                }
                didFinishWithSuccess(userDataArray)
            }) { (errorCode, error) in
                // When messages = 0 but there are users
                if errorCode == 111 { didFinishWithSuccess(userDataArray) }
                didFinishWithError(errorCode, error)
            }
        }

        getMessages.addDependency(getUsers)
        let queue = OperationQueue()
        queue.addOperations([getMessages, getUsers], waitUntilFinished: true)
    }

    // --------------------------
    // MARK: - Other methods
    // --------------------------
    
    func getMessages(for uid: String, didFinishWithSuccess: @escaping ((Message) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        
        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid") as? String else { return }
        
        FirebaseService.shared.fetchMessages(didFinishWithSuccess: { (result) in
            if (result.toId == uid || result.fromId == uid) && (result.toId == currentUserUid || result.fromId == currentUserUid) {
                didFinishWithSuccess(result)
            }
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    func sendMessage(_ text: String?, to user: User?) {
        guard let message = text,
            let user = user else { return }
        FirebaseService.shared.sendMessage(message, to: user)
    }
    
}
