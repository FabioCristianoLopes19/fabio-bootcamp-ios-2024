//
//  Tela02VC.swift
//  TabBarENotificationCenterViewCodeBootcamp
//
//  Created by Fabio Cristiano Lopes on 05/08/24.
//

import Foundation
import UIKit

class Tela02VC: UIViewController {

  var screen: Tela02Screen?

  override func loadView() {
    screen = Tela02Screen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(changeName), name: .changeName, object: nil)
  }

  @objc func changeName(_ notification: NSNotification) {
    print("alterou o nome tela 02")
    let text = notification.object as? String
    screen?.nameLabel.text = text
  }

}
