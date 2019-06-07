//
//  Post.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class Post {
    var photoData: Data?
    let timestamp: Date
    var caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let imageData = photoData else { return nil }
            return UIImage(data: imageData)
        }
        
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(photo: UIImage?, timestamp: Date, caption: String, comments: [Comment] = []) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
}

extension Post: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        var foundMatch = false
        
        if caption.lowercased().contains(searchTerm.lowercased()){
            foundMatch = true
        } else {
            for comment in comments {
                if comment.matches(searchTerm: searchTerm){
                    foundMatch = true
                    break
                }
            }
        }
        
        return foundMatch
    }
}

