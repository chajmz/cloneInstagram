//
//  ViewController.swift
//  AppTurbo
//
//  Created by Guillaume Pabia on 11/12/2015.
//  Copyright © 2015 Guillaume Pabia. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet var tableView: UITableView!
  var postArray = [Post]()


  override func viewDidLoad() {
    super.viewDidLoad()

    // Load data from JSON file
    if let filepath = NSBundle.mainBundle().pathForResource("data_test_ios", ofType: "json") {
      do {
        let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
        let data = contents.dataUsingEncoding(NSUTF8StringEncoding)
        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        for i in 0...json.count-1 {
          let p = Post(json: json[i])
          postArray.append(p!)
        }
      } catch {
      }
    } else {
      print("File not found")
    }

    tableView.dataSource = self
    self.view.addSubview(tableView)
    tableView.estimatedRowHeight = 89
    tableView.rowHeight = UITableViewAutomaticDimension
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  // MARK - TableView 


  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postArray.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostTableViewCell
    cell.configureWithPost(postArray[indexPath.row])
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    return cell
  }
  
    
}

