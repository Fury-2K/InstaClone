//
//  ChatViewModel.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

class ChatViewModel {
    
    var messages: [Message] = []
    var users: [User] = []
    
    // MARK: - Method to fetch UserMessageDictionary
    
    func getUserMessageDictionary(didFinishWithSuccess: @escaping (([UserDataTemp]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        
        let getUsers = BlockOperation {
            self.getUsers(didFinishWithSuccess: { (response) in
                self.users = response.compactMap { $0 }
            }) { (errorCode, error) in
                didFinishWithError(errorCode, error)
            }
        }
        
        let getMessages = BlockOperation {
            self.getAllMessages(didFinishWithSuccess: { (messages) in
                self.messages = messages
                var userData: [UserDataTemp] = []
                for user in self.users {
                    let userMessages = self.messages.filter { $0.toId == user.uid || $0.fromId == user.uid }
                    userData.append(UserDataTemp(user: user, messages: userMessages))
                }
                didFinishWithSuccess(userData)
            }) { (errorCode, error) in
                didFinishWithError(errorCode, error)
            }
        }
        
        getMessages.addDependency(getUsers)
        let queue = OperationQueue()
        
        queue.addOperations([getMessages, getUsers], waitUntilFinished: true)
    }

    private func getUsers(didFinishWithSuccess: @escaping (([User]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.fetchUsers(didFinishWithSuccess: { (result) in
            self.users = result
            didFinishWithSuccess(result)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    private func getAllMessages(didFinishWithSuccess: @escaping (([Message]) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.fetchAllMessages(didFinishWithSuccess: { (messages) in
            didFinishWithSuccess(messages)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    
    // MARK: - Other methods
    
    func getMessages(didFinishWithSuccess: @escaping ((Message) -> Void), didFinishWithError: @escaping ((Int, String) -> Void)) {
        APIClient.fetchMessages(didFinishWithSuccess: { (message) in
            self.messages.append(message)
        }) { (errorCode, error) in
            didFinishWithError(errorCode, error)
        }
    }
    
    func sendMessage(_ text: String?, to user: User?) {
        guard let message = text,
            let user = user else { return }
        APIClient.sendMessage(message, to: user)
    }
    
}
