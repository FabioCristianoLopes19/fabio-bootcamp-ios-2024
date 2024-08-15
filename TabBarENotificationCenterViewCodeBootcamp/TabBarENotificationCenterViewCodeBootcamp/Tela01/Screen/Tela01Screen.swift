//
//  Tela01Screen.swift
//  TabBarENotificationCenterViewCodeBootcamp
//
//  Created by Fabio Cristiano Lopes on 05/08/24.
//

import Foundation
import UIKit

protocol Tela01ScreenProtocol: AnyObject {
  func tappedChangeNameButton()
}

class Tela01Screen: UIView {

  weak var delegate: Tela01ScreenProtocol?

  lazy var nameTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite seu nome"
    tf.borderStyle = .roundedRect
    return tf
  }()

  lazy var changeNameButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.tintColor = .white
    button.setTitle("Alterar nome", for: .normal)
    button.addTarget(self, action: #selector(tappedChangeNameButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedChangeNameButton() {
    delegate?.tappedChangeNameButton()
  }

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 40)
    return label
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .cyan
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(nameTextField)
    addSubview(changeNameButton)
    addSubview(nameLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
      nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

      changeNameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
      changeNameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      changeNameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
    ])
  }

}
