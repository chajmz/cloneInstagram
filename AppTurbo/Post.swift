//
//  Post.swift
//  AppTurbo
//
//  Created by Guillaume Pabia on 11/12/2015.
//  Copyright © 2015 Guillaume Pabia. All rights reserved.
//

import UIKit

class Post {


  // MARK - Properties

  var description: String?
  var title: String?
  var image: UIImage?


  /*
  ** Constructor with JSON Data
  */

  init?(json: AnyObject) {
    if let desc = json["description"] {
      self.description = desc as? String
    }
    if let title = json["title"] {
      self.title = title as? String
    }
    if let urlJson = json["url"] as? String{
      let url = NSURL(string: urlJson)
      let data = NSData(contentsOfURL: url!)
      if data != nil {
        self.image = UIImage(data: data!)
      } else {
        print("Error loading content for image \(self.title!)")
        self.image = UIImage(named: "default_image.png")
      }
    }

  }
}


