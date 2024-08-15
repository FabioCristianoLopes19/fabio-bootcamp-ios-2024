//
//  LoginScreen.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 12/08/24.
//

import Foundation
import UIKit

class LoginScreen: UIView {

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 32)
    label.textAlignment = .center
    label.text = "Seja bem vindo!"
    return label
  }()

  lazy var emailTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "E-mail"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    tf.clearButtonMode = .whileEditing
    return tf
  }()

  lazy var passwordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Senha:"
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedLoginButton() {
    print(#function)
  }

  lazy var orContinueLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 14)
    label.textAlignment = .center
    label.text = "Ou continue com"
    return label
  }()

  lazy var googleButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .white
    button.layer.cornerRadius = 8
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOpacity = 0.1
    button.layer.shadowOffset = CGSize(width: 0, height: 2)
    button.layer.shadowRadius = 8
    button.setImage(UIImage(named: "google_icon"), for: .normal)
    button.addTarget(self, action: #selector(tappedGoogleButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedGoogleButton() {
    print(#function)
  }

  lazy var facebookButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .white
    button.layer.cornerRadius = 8
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOpacity = 0.1
    button.layer.shadowOffset = CGSize(width: 0, height: 2)
    button.layer.shadowRadius = 8
    button.setImage(UIImage(named: "facebook_icon"), for: .normal)
    button.addTarget(self, action: #selector(tappedFacebookButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedFacebookButton() {
    print(#function)
  }

  lazy var registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Não tem conta? Cadastre-se", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedRegisterButton() {
    print(#function)
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
    addSubview(loginButton)
    addSubview(orContinueLabel)
    addSubview(googleButton)
    addSubview(facebookButton)
    addSubview(registerButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
      loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      orContinueLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
      orContinueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      googleButton.topAnchor.constraint(equalTo: orContinueLabel.bottomAnchor, constant: 20),
      googleButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -40),
      googleButton.widthAnchor.constraint(equalToConstant: 100),
      googleButton.heightAnchor.constraint(equalToConstant: 50),

      facebookButton.topAnchor.constraint(equalTo: googleButton.topAnchor),
      facebookButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 40),
      facebookButton.heightAnchor.constraint(equalTo: googleButton.heightAnchor),
      facebookButton.widthAnchor.constraint(equalTo: googleButton.widthAnchor),

      registerButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 40),
      registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
    ])
  }

}
