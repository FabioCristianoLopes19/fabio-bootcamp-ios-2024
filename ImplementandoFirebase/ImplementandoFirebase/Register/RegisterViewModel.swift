//
//  RegisterViewModel.swift
//  ImplementandoFirebase
//
//  Created by Fabio Cristiano Lopes on 24/08/24.
//

import Foundation
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
  func successRegister()
  func errorRegister(title: String, message: String)
  func loading(start: Bool)
}

class RegisterViewModel {
  
  weak var delegate: RegisterViewModelProtocol?
  
  func fetchRegister(email: String, password: String) {
    delegate?.loading(start: true)
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
      guard let self else { return }
      delegate?.loading(start: false)
      // Opção 1
      guard error == nil else {
        delegate?.errorRegister(title: "Atenção!", message: error?.localizedDescription ?? "")
        return
      }
      
      // Opção 2
      //      if let error = error {
      //        print("deu ruim mesmo -> \(error.localizedDescription)")
      //        return
      //      }
      
      delegate?.successRegister()
    }
  }
  
}

