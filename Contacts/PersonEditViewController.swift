//
//  PersonEditViewController.swift
//  Contacts
//
//  Created by Jonathan Bennett on 2014-12-23.
//  Copyright (c) 2014 Jonathan Bennett. All rights reserved.
//

import UIKit

class PersonEditViewController: UIViewController {
  
  @IBOutlet weak var nameField: UITextField!
  var name: String {
    get {
      return nameField.text
    }
    set {
      nameField.text = newValue
    }
  }
  
  var doneCallback: (Void -> Void)?
  var cancelCallback: (Void -> Void)?
  
  @IBAction func didTapDone() {
    doneCallback?()
  }
  
  @IBAction func didTapCancel() {
    cancelCallback?()
  }
  
  class func fromStoryboard() -> PersonEditViewController {
    return UIStoryboard(name: "Person", bundle: nil).instantiateViewControllerWithIdentifier("EditPerson") as PersonEditViewController
  }
}
