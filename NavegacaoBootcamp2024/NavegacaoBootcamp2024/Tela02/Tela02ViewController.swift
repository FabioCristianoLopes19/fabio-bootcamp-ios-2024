//
//  Tela02ViewController.swift
//  NavegacaoBootcamp2024
//
//  Created by Fabio Cristiano Lopes on 15/07/24.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Tela 02"
    }
    
  @IBAction func tappedBackButton(_ sender: UIButton) {
    // quando é modal:
//    dismiss(animated: true)

    // quando é navigation
    navigationController?.popViewController(animated: true)

  }

  @IBAction func tappedShowNewScreenButton(_ sender: UIButton) {
    let tela03 = UIStoryboard(name: "Tela03ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela03ViewController")
    navigationController?.pushViewController(tela03, animated: true)
  }
  
}
