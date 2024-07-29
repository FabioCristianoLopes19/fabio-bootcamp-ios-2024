//
//  ViewController.swift
//  PrimeiraTelaLogin
//
//  Created by Fabio Cristiano Lopes on 10/07/24.
//

import UIKit

class LoginViewController: UIViewController {

  // LIGAÇÕES @IBOutlet SEMPRE são feitas acima dos metodos de ciclo de vida

  // Ligações @IBOutlet são feitas para que possa ser utilizado/configurado as PROPRIEDADES(CARACTERISTICAS) DOS ELEMENTOS!!!

  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configElements()
  }

  @IBAction func tappedLoginButton(_ sender: UIButton) {
    print(#function)
  }

  func configElements() {
    loginLabel.text = "Login"
    loginLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)

    emailTextField.placeholder = "Digite seu email:"
    emailTextField.keyboardType = .emailAddress
    emailTextField.autocorrectionType = .no
    emailTextField.delegate = self
    emailTextField.layer.borderColor = UIColor.lightGray.cgColor
    emailTextField.layer.borderWidth = 1

    passwordTextField.placeholder = "Digite sua senha:"
    passwordTextField.autocorrectionType = .no
    passwordTextField.isSecureTextEntry = true
    passwordTextField.delegate = self
    passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    passwordTextField.layer.borderWidth = 1

    loginButton.setTitle("Login", for: .normal)
    loginButton.backgroundColor = .lightGray
    loginButton.clipsToBounds = true
    loginButton.layer.cornerRadius = 16
    loginButton.isEnabled = false
  }

}

extension LoginViewController: UITextFieldDelegate {

// Este metodo é disparado quando o teclado ESTÁ EM FOCO!!
  func textFieldDidBeginEditing(_ textField: UITextField) {
    print(#function)
    textField.layer.borderColor = UIColor.blue.cgColor
    if emailTextField.text != "" && passwordTextField.text != "" {
      loginButton.isEnabled = true
      loginButton.backgroundColor = .systemBlue
    } else {
      loginButton.isEnabled = false
      loginButton.backgroundColor = .lightGray
    }
  }

  // Este metodo é disparado quando o teclado PERDE O FOCO!!
  // OBS: Este metodo é MUITO utilizado para realizar as validações de campo a campo!!
  func textFieldDidEndEditing(_ textField: UITextField) {
    print(#function)
    textField.layer.borderColor = UIColor.lightGray.cgColor
  }

// Esse metodo é assionado quando CLICA NO BOTÃO RETURN DO TECLADO
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // textField -> perca o foco(abaixe/ocultar o teclado)
    print(#function)
    textField.resignFirstResponder()
    return true
  }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let text = textField.text as? NSString {
      let newText = text.replacingCharacters(in: range, with: string)
       print(newText)
    }
    return true
  }
}

