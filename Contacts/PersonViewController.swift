//
//  PersonViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
  
  @IBOutlet weak var textLabel: UILabel!
  var name: String = "" {
    didSet {
      if textLabel != nil {
        title = "Hello \(name)"
        textLabel.text = "Hello there \(name)"
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Hello \(name)"
    textLabel.text = "Hello there \(name)"
  }
  
  class func fromStoryboard() -> PersonViewController {
    return UIStoryboard(name: "Person", bundle: nil).instantiateViewControllerWithIdentifier("Person") as PersonViewController
  }
  
}
