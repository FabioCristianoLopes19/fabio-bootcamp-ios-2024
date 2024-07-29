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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        configElements()
    }
    
    func configElements () {
        
        numberOneTextField.placeholder = "Digite o primeiro número"
        numberOneTextField.delegate = self
        
        numberTwoTextField.placeholder = "Digite o segundo número"
        numberTwoTextField.delegate = self
        
    }
    
    @IBAction func tappedResultButton(_ sender: UIButton) {
        
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(identifier: "Tela02ViewController") { coder -> Tela02ViewController? in
            
            let numberOne : Int = Int(self.numberOneTextField.text ?? "0") ?? 0
            let numberTwo : Int = Int(self.numberTwoTextField.text ?? "0") ?? 0
            
            let resultTotal: String = "Resultado é de \(numberOne + numberTwo)"
            return Tela02ViewController(coder: coder, resultButton: resultTotal)
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

