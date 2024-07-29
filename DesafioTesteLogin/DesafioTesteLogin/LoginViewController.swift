//
//  ViewController.swift
//  DesafioTesteLogin
//
//  Created by Fabio Cristiano Lopes on 11/07/24.
//

import UIKit

class LoginViewController: BaseViewController {

  // LIGAÇÕES @IBOutlet SEMPRE são feitas acima dos metodos de ciclo de vida

  // Ligações @IBOutlet são feitas para que possa ser utilizado/configurado as PROPRIEDADES(CARACTERISTICAS) DOS ELEMENTOS!!!

  
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var eyePasswordImageView: UIImageView!
    @IBOutlet weak var eyeConfirmPasswordImageView: UIImageView!

    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      configElements()
      configEyeButtonGesture()
    }

    func configElements() {
      view.backgroundColor = .orange

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
      eyePasswordImageView.image = UIImage(systemName: "eye")

      confirmPasswordTextField.placeholder = "Confirme sua senha:"
      confirmPasswordTextField.autocorrectionType = .no
      confirmPasswordTextField.isSecureTextEntry = true
      confirmPasswordTextField.delegate = self
      confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
      confirmPasswordTextField.layer.borderWidth = 1
      eyeConfirmPasswordImageView.image = UIImage(systemName: "eye")

      loginButton.setTitle("Login", for: .normal)
      loginButton.clipsToBounds = true
      loginButton.layer.cornerRadius = 16
      isEnabledLoginButton(isEnable: false)
    }

    func isEnabledLoginButton(isEnable: Bool) {
      loginButton.isEnabled = isEnable
      loginButton.backgroundColor = isEnable ? .systemBlue : .lightGray
    }

    func configEyeButtonGesture() {
      let tapEyePassword: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedEyePasswordButton))
      tapEyePassword.cancelsTouchesInView = false
      tapEyePassword.numberOfTapsRequired = 1
      eyePasswordImageView.isUserInteractionEnabled = true
      eyePasswordImageView.addGestureRecognizer(tapEyePassword)

      let tapEyeConfirmPassword: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedEyeConfirmPasswordButton))
      tapEyeConfirmPassword.cancelsTouchesInView = false
      tapEyeConfirmPassword.numberOfTapsRequired = 1
      eyeConfirmPasswordImageView.isUserInteractionEnabled = true
      eyeConfirmPasswordImageView.addGestureRecognizer(tapEyeConfirmPassword)
    }

    @objc func tappedEyePasswordButton() {
  //    if passwordTextField.isSecureTextEntry {
  //      passwordTextField.isSecureTextEntry = false
  //      eyePasswordImageView.image = UIImage(systemName: "eye.slash")
  //    } else {
  //      passwordTextField.isSecureTextEntry = true
  //      eyePasswordImageView.image = UIImage(systemName: "eye")
  //    }

      passwordTextField.isSecureTextEntry.toggle()
      let image = passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
      eyePasswordImageView.image = image
    }

    @objc func tappedEyeConfirmPasswordButton() {
  //    if confirmPasswordTextField.isSecureTextEntry {
  //      confirmPasswordTextField.isSecureTextEntry = false
  //      eyeConfirmPasswordImageView.image = UIImage(systemName: "eye.slash")
  //    } else {
  //      confirmPasswordTextField.isSecureTextEntry = true
  //      eyeConfirmPasswordImageView.image = UIImage(systemName: "eye")
  //    }

      confirmPasswordTextField.isSecureTextEntry.toggle()
      let image = confirmPasswordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
      eyeConfirmPasswordImageView.image = image
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
        if isValidEmail(emailTextField.text ?? "") && isValidPassword(passwordTextField.text ?? "") &&  passwordTextField.text ?? "" == confirmPasswordTextField.text ?? "" {
          isEnabledLoginButton(isEnable: true)
        } else {
          isEnabledLoginButton(isEnable: false)
        }
      }
      return false
    }
  }

    
