//
//  AppDelegate.swift
//  Continuum
//
//  Created by DevMountain on 2/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    /* post 1*/
    PostController.shared.createPostWith(image: #imageLiteral(resourceName: "spaceEmptyState.jpg"), caption: "Not really waterfall") { (post) in

    }
    let mockPost = PostController.shared.posts[0]
    PostController.shared.addComment(fromText: "Isn't this a picture of space?", toPost: mockPost) { (comment) in

    }
    PostController.shared.addComment(fromText: "It also has a cat in it.", toPost: mockPost) { (comment) in

    }
    
    /* post 2*/
    PostController.shared.createPostWith(image: #imageLiteral(resourceName: "spaceEmptyState.jpg"), caption: "This is a picture of pudding") { (post) in
        
    }
    let mockPost2 = PostController.shared.posts[1]
    PostController.shared.addComment(fromText: "Isn't this a picture of cake?", toPost: mockPost2) { (comment) in
        
    }
    PostController.shared.addComment(fromText: "It also has a spoon in it.", toPost: mockPost2) { (comment) in
        
    }

    
    /* post 3*/
    PostController.shared.createPostWith(image: #imageLiteral(resourceName: "spaceEmptyState.jpg"), caption: "This is a picture of space.") { (post) in
        
    }
    let mockPost3 = PostController.shared.posts[2]
    PostController.shared.addComment(fromText: "Look at the moon!", toPost: mockPost3) { (comment) in
        
    }
    PostController.shared.addComment(fromText: "There's a cake on the moon.", toPost: mockPost3) { (comment) in
        
    }

    
    
    /* post 4*/
    PostController.shared.createPostWith(image: #imageLiteral(resourceName: "spaceEmptyState.jpg"), caption: "This is a selfie.") { (post) in
        
    }
    let mockPost4 = PostController.shared.posts[3]
    PostController.shared.addComment(fromText: "Isn't that your dog?", toPost: mockPost4) { (comment) in
        
    }
    PostController.shared.addComment(fromText: ".......", toPost: mockPost4) { (comment) in
        
    }


//    print("Checking if this mockPost contains Cat: \(mockPost.matches(searchTerm: "Cat"))")
//    print("Checking if this mockPost contains space: \(mockPost.matches(searchTerm: "space"))")
//    print("Checking if this mockPost contains waterfall: \(mockPost.matches(searchTerm: "waterfall"))")
//    print("Checking if this mockPost contains pudding: \(mockPost.matches(searchTerm: "pudding"))")
    
    return true
  }


}

