//
//  CompaniesViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class CompaniesViewController: UITableViewController {
  
  var companies = ["Acme Inc.", "Apple", "Microsoft", "Google"] // TODO: make mutable
  
  @IBAction func didTapAdd() {
    let editViewController = CompanyEditViewController.fromStoryboard()
    let navViewController = UINavigationController(rootViewController: editViewController)
    
    editViewController.doneCallback = {
      if editViewController.name != "" {
        self.companies.append(editViewController.name)
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
  
  // Mark - UITableViewControllerDataSource
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return companies.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath)  as UITableViewCell
    let company = companies[indexPath.row]
    
    cell.textLabel?.text = company
    
    return cell
  }
  
}
