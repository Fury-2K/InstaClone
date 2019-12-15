//
//  Message.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 06/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class Message {
    var toId: String
    var fromId: String
    var text: String
    var timeStamp: Int
    
    init(toId: String, fromId: String, text: String, timeStamp: Int) {
        self.toId = toId
        self.fromId = fromId
        self.text = text
        self.timeStamp = timeStamp
    }
    
    func getFormattedTimeStamp() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
}
