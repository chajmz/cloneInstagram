//
//  PostTableViewCell.swift
//  AppTurbo
//
//  Created by Guillaume Pabia on 12/12/2015.
//  Copyright © 2015 Guillaume Pabia. All rights reserved.
//

import UIKit


class PostTableViewCell: UITableViewCell {

  // MARK - Properties

  @IBOutlet var img: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var likeButton: UIButton!

  var isLiked: Bool = true


  // MARK - Actions

  @IBAction func likeAction(sender: AnyObject) {
    if isLiked {
      likeButton.setTitle("Unlike", forState: UIControlState.Normal)
      isLiked = false
    } else {
      isLiked = true
      likeButton.setTitle("Like", forState: UIControlState.Normal)
    }
  }


  override func awakeFromNib() {
    super.awakeFromNib()
  }


  func configureWithPost(post: Post) {
    descriptionLabel.text = post.description
    titleLabel.text = post.title
    descriptionLabel.font = UIFont(name: "Helvetica-Light", size: 15)
    titleLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
    img.image = post.image
  }

}