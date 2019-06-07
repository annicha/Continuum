//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    
    // MARK: - Properties
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateView()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func commentButtonTapped(_ sender: Any) {

        let alertController = UIAlertController(title: "Add comment", message: "Add a new comment to this post.", preferredStyle: .alert)
        
        /* textfield */
        alertController.addTextField { (textField) in
            textField.placeholder = ""
            textField.keyboardType = .default
        }
        
        /* actions */
        let okAction = UIAlertAction(title: "OK", style: .default){ (_) in
            guard let textFieldText = alertController.textFields?.first?.text, let post = self.post, textFieldText != "" else {return}
            PostController.shared.addComment(fromText: textFieldText, toPost: post, completion: { (comment) in

            })
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true) {
        }
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Methods
    func updateView(){
        guard let post = post,
            let image = post.photo else {return}
        photoImageView.image = image
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else {return 0}
        return post.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        guard let post = post else {return UITableViewCell()}
        let comment = post.comments[indexPath.row]
        cell.textLabel?.text = comment.text
        cell.detailTextLabel?.text = DateHelper.dateStringFrom(date: comment.timestamp)
        return cell
    }

}
