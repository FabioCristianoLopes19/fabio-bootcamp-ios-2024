//
//  LoginScreen.swift
//  PrimeiroAppViewCode
//
//  Created by Fabio Cristiano Lopes on 18/07/24.
//

import UIKit

//MARK: EXCLUIR REFERENCIA STORYBOARD
//PASSO A PASSO
// 1 - Acessar GENERAL do novo projeto e excluir "MAIN" do campo Main Interface
// 2 - Excluir o arquivo Main.storyboard (selecionar Move to Trash)
// 3 - Arquivo INFO, pesquisar com Command+F "MAIN"e excluir selecionando o botão (-)


// MARK: - RECEITA DE BOLO VIEWCODE
// PASSO A PASSO

// 1 - Criar Screen (ex: LoginViewController -> LoginScreen. RegisterViewController -> RegisterScreen)
// 2 - Chamar construtor
// Exemplo:
// init() {
//  super.init(frame: .zero)
// }
//
// required init?(coder: NSCoder) {
//  fatalError("init(coder:) has not been implemented")
// }
// 3 - Criar e configurar elemento (NÃO SE ESQUEÇA DO translatesAutoresizingMaskIntoConstraints = false)
// 4 - Adicionar elemento (não se esqueça de chamar função)
// 5 - Configurar constraints (não se esqueça de chamar função)
// 6 - Chamar no LoadView
// 7 - Corre pro abraço!!!





// Criando protocolo
// Coloque o nome do seu protocol o com sufixo Protocol (apenas recomendação, você pode colocar o nome que quiser).
// SEMPRE coloque : AnyObject
// SEMPRE declare com:
// weak var delegate: NomeDoProtocol?

protocol LoginScreenProtocol: AnyObject {
  func tappedLoginButton()
  func tappedRegisterButton()
}


class LoginScreen: UIView {

  weak var delegate: LoginScreenProtocol?

  lazy var loginLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Login"
    label.font = UIFont.boldSystemFont(ofSize: 28)
    return label
  }()

  lazy var logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "person.fill")
    imageView.tintColor = .lightGray
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  lazy var emailTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite seu e-mail:"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    return tf
  }()

  lazy var passwordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite sua senha:"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var loginButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    return button
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Não tem conta? Cadastre-se", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedLoginButton() {
    delegate?.tappedLoginButton()
  }

  @objc func tappedRegisterButton() {
    delegate?.tappedRegisterButton()
  }

  init() {
    super.init(frame: .zero)
    backgroundColor = .orange
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(loginLabel)
    addSubview(logoImageView)
    addSubview(emailTextField)
    addSubview(passwordTextField)
    addSubview(loginButton)
    addSubview(registerButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      logoImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
      logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 100),
      logoImageView.widthAnchor.constraint(equalToConstant: 100),

      emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      passwordTextField.heightAnchor.constraint(equalToConstant: 40),

      registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
      registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      registerButton.heightAnchor.constraint(equalToConstant: 40),

      loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
      loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
      loginButton.heightAnchor.constraint(equalToConstant: 40),
    ])
  }

}
