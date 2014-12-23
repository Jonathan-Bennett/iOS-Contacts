//
//  PeopleViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
  
  var people = ["Bob", "Susan", "Joe", "Kelly"] // TODO: allow changes
  
  @IBAction func didTapAdd() {
    let editViewController = PersonEditViewController.fromStoryboard()
    let navViewController = UINavigationController(rootViewController: editViewController)

    editViewController.doneCallback = {
      self.people.append(editViewController.name)
      self.tableView.reloadData()
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    editViewController.cancelCallback = {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    parentViewController?.presentViewController(navViewController, animated: true, completion: nil)
  }
  
  // Mark - UITableViewDataSource
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as UITableViewCell
    let person = people[indexPath.row]
    
    cell.textLabel?.text = person
    
    return cell
  }
  
  
}
