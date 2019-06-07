//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate {
    func updateView(forCell cell: PostTableViewCell, withPost post: Post)
}

class PostTableViewCell: UITableViewCell {
    // MARK: IB Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    
    // MARK: Delegate
    var delegate: PostTableViewCellDelegate?
    
    // MARK: Properties
    var post: Post? {
        didSet {
           updateViews()
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
        postImageView.image = post.photo
        captionLabel.text = post.caption
        commentsCountLabel.text = "\(post.comments.count)"
    }
}
