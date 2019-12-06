//
//  FeedData.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit

class FeedData {
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    var feedPics: [String]
    var profilePic: String?
    var uid: String
    var likes: Int
    
    init(_ username: String, _ firstName: String, _ lastName: String, _ email: String, _ feedPics: [String], uid: String) {
        self.username = "UserName"//username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.feedPics = feedPics
        self.uid = ""//uid
        self.profilePic = feedPics[0]
        self.likes = 0
    }
    
}
