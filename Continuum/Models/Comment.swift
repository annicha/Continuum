//
//  Comment.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class Comment {
    var text: String
    let timestamp: Date
    weak var post: Post?
    
    init(text: String, timestamp: Date, post: Post?) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}
