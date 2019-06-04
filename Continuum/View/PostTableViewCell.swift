//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: IB Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    
    
    // MARK: Properties
    var post: Post? {
        didSet {
            updateView()
        }
    }
    
    // MARK: Methods
    func updateView(){
        let commentsCount = post?.comments.count
        
        postImageView.image = post?.photo
        captionLabel.text = post?.caption
        commentsCountLabel.text = String(commentsCount ?? 0)
    }
}
