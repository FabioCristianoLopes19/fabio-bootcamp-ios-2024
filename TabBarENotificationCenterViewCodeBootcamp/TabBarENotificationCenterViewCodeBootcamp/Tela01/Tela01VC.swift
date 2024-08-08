//
//  Tela01VC.swift
//  TabBarENotificationCenterViewCodeBootcamp
//
//  Created by Fabio Cristiano Lopes on 05/08/24.
//

import Foundation
import UIKit

class Tela01VC: UIViewController {

  var screen: Tela01Screen?

  override func loadView() {
    screen = Tela01Screen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.delegate = self
  }

}

extension Tela01VC: Tela01ScreenProtocol {
  func tappedChangeNameButton() {
    let text = screen?.nameTextField.text ?? ""
    screen?.nameLabel.text = text
    NotificationCenter.default.post(name: .changeName, object: text)
  }
}


extension NSNotification.Name {
  static let changeName = Self("changeName")
}
