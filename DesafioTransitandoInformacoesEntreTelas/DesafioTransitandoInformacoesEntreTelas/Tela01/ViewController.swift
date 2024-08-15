//
//  ViewController.swift
//  DesafioTransitandoInformacoesEntreTelas
//
//  Created by Fabio Cristiano Lopes on 17/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var somaLabel: UILabel!
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    
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
    
    func configElements () {
        somaLabel.text = "SOMA"
        somaLabel.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        
        numberOneTextField.placeholder = "Digite o primeiro número"
        numberOneTextField.delegate = self
        
        numberTwoTextField.placeholder = "Digite o segundo número"
        numberTwoTextField.delegate = self
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {

        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(identifier: "Tela02ViewController") { coder -> Tela02ViewController? in
            
            let numberOne : Int = Int(self.numberOneTextField.text ?? "0") ?? 0
            let numberTwo : Int = Int(self.numberTwoTextField.text ?? "0") ?? 0
            
            let resultTotal: String = "Resultado é de \(numberOne + numberTwo)"
            return Tela02ViewController(coder: coder, resultTotal: resultTotal)
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

