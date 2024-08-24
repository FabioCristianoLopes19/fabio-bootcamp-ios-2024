//
//  LoginViewModel.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 24/08/24.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
  func successLogin()
  func errorLogin(title: String, message: String)
  func loading(start: Bool)
}

class LoginViewModel {

  weak var delegate: LoginViewModelProtocol?

  func fetchLogin(email: String, password: String) {
    // start loading
    delegate?.loading(start: true)
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
      guard let self else { return }
    delegate?.loading(start: false)

      // Opção 1
      guard error == nil else {
        delegate?.errorLogin(title: "Atenção!", message: error?.localizedDescription ?? "")
        return
      }

      // Opção 2
      //      if let error = error {
      //        print("deu ruim mesmo -> \(error.localizedDescription)")
      //        return
      //      }

      delegate?.successLogin()
    }
  }

}

