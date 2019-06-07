//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Annicha on 4/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    //MARK: - Properties
    var resultsArray: [Post] = []
    var isSearching: Bool = false
    var dataSource: [Post] {
        return isSearching == true ? resultsArray : PostController.shared.posts
    }
    
    //MARK: - IB Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        let post = dataSource[indexPath.row]
        cell.post = post
        
//        cell.postImageView.image = post.photo
//        cell.captionLabel.text = post.caption
//        cell.commentsCountLabel.text = "\(post.comments.count)"
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let post = dataSource[indexPath.row]
            PostController.shared.remove(post: post)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
            guard let destinationVC = segue.destination as? PostDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow,
                PostController.shared.posts.count > 0
                else {return}
                let post = PostController.shared.posts[indexPath.row]
                destinationVC.post = post
        }
    }
}

//extension PostListTableViewController: PostTableViewCellDelegate {
//    func updateView(forCell cell: PostTableViewCell, withPost post: Post) {
//        let commentsCount = post.comments.count
//        cell.postImageView.image = post.photo
//        cell.captionLabel.text = post.caption
//        cell.commentsCountLabel.text = String(commentsCount)
//    }
//}

extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print("Did change")
        if searchText != "" {
            resultsArray = PostController.shared.posts.filter { (post) -> Bool in
                return post.matches(searchTerm: searchText)
            }
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsArray = PostController.shared.posts
        tableView.reloadData()
        searchBar.text = ""
        
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
        print("Searching..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
        print("Stop searching..")
    }
}

