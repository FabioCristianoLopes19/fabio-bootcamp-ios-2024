//
//  Tela03VC.swift
//  TabBarENotificationCenterViewCodeBootcamp
//
//  Created by Fabio Cristiano Lopes on 05/08/24.
//

import Foundation
import UIKit

class Tela03VC: UIViewController {

  var screen: Tela03Screen?

  override func loadView() {
    screen = Tela03Screen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(changeName), name: .changeName, object: nil)
  }

  @objc func changeName(_ notification: NSNotification) {
    print("alterou o nome tela 03")
    let text = notification.object as? String
    screen?.nameLabel.text = text
  }
}
