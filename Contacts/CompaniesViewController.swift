//
//  CompaniesViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class CompaniesViewController: UITableViewController {
  
  let companies = ["Acme Inc.", "Apple", "Microsoft", "Google"] // TODO: make mutable
  
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
