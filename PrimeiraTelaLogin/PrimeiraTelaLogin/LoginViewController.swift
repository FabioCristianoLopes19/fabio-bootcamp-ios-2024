//
//  ViewController.swift
//  PrimeiraTelaLogin
//
//  Created by Fabio Cristiano Lopes on 10/07/24.
//

import UIKit

class LoginViewController: BaseViewController {

  // LIGAÇÕES @IBOutlet SEMPRE são feitas acima dos metodos de ciclo de vida

  // Ligações @IBOutlet são feitas para que possa ser utilizado/configurado as PROPRIEDADES(CARACTERISTICAS) DOS ELEMENTOS!!!

  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!

    
// viewDidLoad(): Chamado quando a view do view controller é carregada na memória.
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configElements()
  }

  // Ligações @IBAction representam AÇÃO DOS ELEMENTOS!!
  // OBS: As ligações @IBAction sempre ficam em baixo dos metodos de ciclo de vida!!
  @IBAction func tappedLoginButton(_ sender: UIButton) {
    let alertController = UIAlertController(title: "Seja bem vindo!", message: "Aproveite o nosso app ;)", preferredStyle: .alert)

    let okButton = UIAlertAction(title: "OK", style: .default) { _ in
      print("cliquei no OK")
    }

    let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
      print("cliquei no Cancelar")
    }

    alertController.addAction(okButton)
    alertController.addAction(cancelButton)
    present(alertController, animated: true)
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
    loginButton.clipsToBounds = true
    loginButton.layer.cornerRadius = 16
    isEnabledLoginButton(isEnable: false)
  }

  func isEnabledLoginButton(isEnable: Bool) {
    loginButton.isEnabled = isEnable
    loginButton.backgroundColor = isEnable ? .systemBlue : .lightGray
  }

  func isValidEmail(_ email: String) -> Bool {
      let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
      return emailPred.evaluate(with: email)
  }

  func isValidPassword(_ password: String) -> Bool {
      let passwordPattern = ".{6,}"
      let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
      return passwordPred.evaluate(with: password)
  }
}

extension LoginViewController: UITextFieldDelegate {

// Este metodo é disparado quando o teclado ESTÁ EM FOCO!!
  func textFieldDidBeginEditing(_ textField: UITextField) {
    print(#function)
    textField.layer.borderColor = UIColor.blue.cgColor
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
      textField.text = newText
      if isValidEmail(emailTextField.text ?? "") && isValidPassword(passwordTextField.text ?? "") {
        isEnabledLoginButton(isEnable: true)
      } else {
        isEnabledLoginButton(isEnable: false)
      }
    }
    return false
  }
}

