//
//  UserData.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 09/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class UserDataTemp {
    var user: User
    var messages: [Message]
    
    init(user: User, messages: [Message] = []) {
        self.user = user
        self.messages = messages.sorted(by: { (message1, message2) -> Bool in
            return message1.timeStamp < message2.timeStamp
        })
    }
}
