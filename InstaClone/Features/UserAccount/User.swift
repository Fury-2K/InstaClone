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
    var profileImgUrl: String
    var uid: String
    
    init(username: String = "", name: String = "", profileImgUrl: String = "", uid: String = "") {
        self.username = username
        self.name = name
        self.profileImgUrl = profileImgUrl
        self.uid = uid
    }
}
