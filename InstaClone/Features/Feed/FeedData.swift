//
//  FeedData.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit

struct FeedData: Codable {
    let username: String = "UserName"
    let firstName: String
    let lastName: String
    let email: String
    let feedPics: [String]
    let profilePic: String?
    let uid: String
    var likes: Int
    
    init(_ username: String, _ firstName: String, _ lastName: String, _ email: String, _ feedPics: [String], uid: String) {
//        self.username = "UserName"//username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.feedPics = feedPics
        self.uid = ""//uid
        self.profilePic = feedPics[0]
        self.likes = 0
    }
}
