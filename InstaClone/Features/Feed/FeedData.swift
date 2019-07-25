//
//  FeedData.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import Foundation
import UIKit

class FeedData {
    var gender: String
    var firstName: String
    var lastName: String
    var email: String
    var dp: [String]
    var likes: Int
    
    init(_ gender: String, _ firstName: String, _ lastName: String, _ email: String, _ dp: [String]) {
        self.gender = gender
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dp = dp
        self.likes = 0
    }
    
}
