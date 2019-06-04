//
//  PostController.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    // MARK: - Singleton
    static let shared = PostController()
    
    // MARK: - Source of Truth
    var posts: [Post] = []
    
    // MARK: - CRUD Functions
    func addComment(fromText text: String, toPost post: Post, completion: @escaping(Comment) -> Void){
        let newComment = Comment(text: text, timestamp: Date(), post: post)
        newComment.post?.comments += [newComment]
        // waiting CloudKit completion
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping(Post?) -> Void){
        let newPost = Post(photo: image, timestamp: Date(), caption: caption)
        self.posts += [newPost]
        // waiting CloudKit completion
    }
}
