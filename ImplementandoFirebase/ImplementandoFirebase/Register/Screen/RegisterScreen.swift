//
//  RegisterScreen.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 24/08/24.
//

import Foundation
import UIKit

protocol RegisterScreenProtocol: AnyObject {
  func tappedBackButton()
  func tappedRegisterButton()
}

class RegisterScreen: UIView {

  weak var delegate: RegisterScreenProtocol?

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 32)
    label.text = "Crie sua conta"
    return label
  }()

  lazy var emailTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "E-mail"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    return tf
  }()

  lazy var passwordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite sua senha"
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var confirmPasswordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Confirme sua senha"
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Cadastrar", for: .normal)
    button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedRegisterButton() {
    delegate?.tappedRegisterButton()
  }

  lazy var backButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Voltar", for: .normal)
    button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedBackButton() {
    delegate?.tappedBackButton()
  }

  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(titleLabel)
    addSubview(emailTextField)
    addSubview(passwordTextField)
    addSubview(confirmPasswordTextField)
    addSubview(registerButton)
    addSubview(backButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
      confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      confirmPasswordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
      registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      registerButton.heightAnchor.constraint(equalToConstant: 50),

      backButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
      backButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      backButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      backButton.heightAnchor.constraint(equalTo: registerButton.heightAnchor),
    ])
  }
}

