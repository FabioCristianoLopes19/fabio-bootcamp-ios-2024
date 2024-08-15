//
//  ViewController.swift
//  CustomViewBootcamp
//
//  Created by Caio Fabrini on 12/08/24.
//

import UIKit

class LoginViewController: UIViewController {

  var screen: LoginScreen?

  override func loadView() {
    screen = LoginScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
        
  }

}

