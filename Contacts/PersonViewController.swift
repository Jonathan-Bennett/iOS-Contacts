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
  
  @IBAction func didTapEdit() {
    let editViewController = PersonEditViewController.fromStoryboard()
    let navViewController = UINavigationController(rootViewController: editViewController)
    
    
    editViewController.doneCallback = {
      if editViewController.name != "" {
        self.name = editViewController.name
        self.dismissViewControllerAnimated(true, completion: nil)
      } else {
        // TODO: display error message
      }
    }
    
    editViewController.cancelCallback = {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    parentViewController?.presentViewController(navViewController, animated: true) {
      editViewController.name = self.name // TODO: flashes, ewww
    }
  }

  
  class func fromStoryboard() -> PersonViewController {
    return UIStoryboard(name: "Person", bundle: nil).instantiateViewControllerWithIdentifier("Person") as PersonViewController
  }
  
}
