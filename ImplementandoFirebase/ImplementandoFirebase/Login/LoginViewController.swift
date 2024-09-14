//
//  ViewController.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 12/08/24.
//

import UIKit
import FirebaseAuth

//MARK: - Como adicionar um pod no projeto?

// 1 -> no terminal acesse a pasta raiz do projeto, e realize o comando 'pod init'
// Esse comando irá criar o file PodFile -> arquivo responsável por configurar/adicionar as dependências do projeto
// 2 -> adicione o seu pod entre o pod target... e o 'end'
// Ex:
//target 'ImplementandoFirebase' do
//# Comment the next line if you don't want to use dynamic frameworks
//use_frameworks!
//
//pod 'FirebaseAuth'
//pod 'FirebaseFirestore'
//
//end
// 3 -> depois de adicionar, abra o terminal novamente na pasta raiz do projeto e realize o comando 'pod install'
// 4 -> depois de baixar todas as dependências, abra o projeto no arquivo .xcworkspace(arquivo em branco) pois será nele que você irá trabalhar de agora em diante.

//MARK: - Posso adicionar/remover um pod?

// Sim, você pode remover/adicionar a qualquer momento, acessando o arquivo do PodFile e realizando o seu ajuste necessário.
// Depois disso feche o xcode, e abra o terminal na pasta raiz e execute o comando 'pod install'
// ATENÇÃO: O comando 'pod install' ele tanto adiciona, como remove pods do projeto, por isso, tome sempre muito cuidado com o arquivo PodFile.

//MARK: - Como utilizar o código de um pod no meu projeto?

// Para utilizar o código de um pod é muito simples, basta na classe que você queira acessar o codigo, você realizar o import na parte superior do arquivo daquela devida dependência
// Ex: import FirebaseAuth

class LoginViewController: UIViewController {

  var screen: LoginScreen?
  var viewModel: LoginViewModel = LoginViewModel()
  var loading: Loading?

  override func loadView() {
    screen = LoginScreen()
    view = screen
  }

  // TODA VEZ que você for customizar uma navigationController, você precisa reforçar com o ciclo de vida viewWillAppear, pois sempre que voltar para a sua tela, ele vai disparar este método que com ele, vai configurar exatamente a sua navigation da forma que você precisa para ESSA TELA!
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = true
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

extension LoginViewController: LoginScreenProtocol {
  func tappedRegisterButton() {
    navigationController?.pushViewController(RegisterViewController(), animated: true)
  }
  
  func tappedLoginButton() {
    guard let email: String = screen?.emailTextField.text,
          let password: String = screen?.passwordTextField.text,
          !email.isEmpty,
          !password.isEmpty else {
      showAlert(title: "Atenção!", message: "Por favor, preencha todos os campos")
      return
    }

    viewModel.fetchLogin(email: email, password: password)
  }
}

extension LoginViewController: LoginViewModelProtocol {
  func loading(start: Bool) {
    if start {
//      loading?.start(message: "Carregando...")
      LoadingLottie.shared.start(message: "Carregando...")
    } else {
//      loading?.stop()
//      LoadingLottie.shared.stop()
    }
  }
  
  func successLogin() {
    print("Showw, login feito com sucesso!")
  }
  
  func errorLogin(title: String, message: String) {
   showAlert(title: title, message: message)
  }
}
