//
//  ViewController.swift
//  TransitandoDadosEntreTelas
//
//  Created by Fabio Cristiano Lopes on 17/07/24.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!

  // Ciclo de vida que é disparado quando a tela VAI SER EXIBIDA!!
  // Muito comum a sua utilização para animações
  override func viewWillAppear(_ animated: Bool) {
    print(#function)
  }

  // 1 ciclo de vida de uma aplicação
  // Este metodo é disparado uma UNICA VEZ!
  // Metodo utilizado para configurar TUDO OQUE É DE INICIO NA TELA!
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function)
    view.backgroundColor = .orange
    configElements()
  }

  // Ciclo de vida que é disparado quando a tela ESTÁ SENDO EXIBIDA!!
  // Muito comum a sua utilização para animações
  override func viewDidAppear(_ animated: Bool) {
    print(#function)
  }

  // Ciclo de vida que é disparado quando a tela VAI DESAPARECER!!
  // Muito comum a sua utilização para animações
  override func viewWillDisappear(_ animated: Bool) {
    print(#function)
  }

  // Ciclo de vida que é disparado quando a tela DESAPARECEU!!
  // Muito comum a sua utilização para animações
  override func viewDidDisappear(_ animated: Bool) {
    print(#function)
  }

  func configElements() {
    firstNameTextField.placeholder = "Digite seu primeiro nome:"
    firstNameTextField.delegate = self

    lastNameTextField.placeholder = "Digite seu último nome:"
    lastNameTextField.delegate = self
  }




  @IBAction func tappedFullNameButton(_ sender: UIButton) {

    let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(identifier: "Tela02ViewController") { coder -> Tela02ViewController? in
      let fullName: String = "\(self.firstNameTextField.text ?? "") \(self.lastNameTextField.text ?? "")"
       return Tela02ViewController(coder: coder, fullName: fullName)
    }

    navigationController?.pushViewController(tela02, animated: true)
  }

}

extension ViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

}


