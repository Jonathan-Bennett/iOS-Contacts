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
      if editViewController.name != "" {
        self.people.append(editViewController.name)
        self.tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
      } else {
        // TODO: display error message
      }
    }
    
    editViewController.cancelCallback = {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    parentViewController?.presentViewController(navViewController, animated: true, completion: nil)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let person = people[indexPath.row]
    let personViewController = PersonViewController.fromStoryboard()
    personViewController.name = person
    
    navigationController?.pushViewController(personViewController, animated: true)
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
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    switch editingStyle {
    case .Delete:
      people.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    default:
      println("wave")
    }
  }
  
}
