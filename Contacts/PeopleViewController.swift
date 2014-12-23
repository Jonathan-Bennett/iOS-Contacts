//
//  PeopleViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
  
  let people = ["Bob", "Susan", "Joe", "Kelly"] // TODO: allow changes
  
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
