//
//  User.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject {
    var username: String
    var name: String
    var profilePic: String?
    var uid: String
    
    init(username: String, name: String, profilePic: String? = nil, uid: String) {
        self.username = username
        self.name = name
        self.profilePic = profilePic
        self.uid = uid
    }
}
