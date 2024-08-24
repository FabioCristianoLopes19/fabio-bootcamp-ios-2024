//
//  RegisterViewController.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 24/08/24.
//

import UIKit

class RegisterViewController: UIViewController {

  var screen: RegisterScreen?
  let viewModel: RegisterViewModel = RegisterViewModel()
  var loading: Loading?

  override func loadView() {
    screen = RegisterScreen()
    view = screen
  }

  override func viewWillAppear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.delegate = self
    viewModel.delegate = self
    loading = Loading(viewController: self)
  }

  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default)
    alertController.addAction(okButton)
    present(alertController, animated: true)
  }
}

extension RegisterViewController: RegisterScreenProtocol {
  func tappedBackButton() {
    navigationController?.popViewController(animated: true)
  }
  
  func tappedRegisterButton() {
    guard let email: String = screen?.emailTextField.text,
          let password: String = screen?.passwordTextField.text,
          let confirmPassword: String = screen?.confirmPasswordTextField.text,
          !email.isEmpty,
          !password.isEmpty,
          !confirmPassword.isEmpty else {
      showAlert(title: "Atenção!", message: "Por favor, preencha todos os campos")
      return
    }
// Opção 1
    guard password == confirmPassword else {
      showAlert(title: "Atenção!", message: "Campo de senha e confirmar senha devem ser iguais")
      return
    }

// Opção 2
//    if password != confirmPassword {
//      showAlert(title: "Atenção!", message: "Campo de senha e confirmar senha devem ser iguais")
//      return
//    }
    viewModel.fetchRegister(email: email, password: password)
  }
}

extension RegisterViewController: RegisterViewModelProtocol {
  func loading(start: Bool) {
    if start {
      loading?.start()
    } else {
      loading?.stop()
    }
  }
  
  func successRegister() {
    showAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso!")
  }
  
  func errorRegister(title: String, message: String) {
    showAlert(title: title, message: message)
  }
}

