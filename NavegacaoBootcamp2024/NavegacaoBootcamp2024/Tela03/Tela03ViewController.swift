//
//  Tela03ViewController.swift
//  NavegacaoBootcamp2024
//
//  Created by Fabio Cristiano Lopes on 15/07/24.
//

import UIKit

class Tela03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Tela 03"
    }
    
  @IBAction func tappedBackButton(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func tappedBackRootButton(_ sender: UIButton) {
    navigationController?.popToRootViewController(animated: true)
  }
  
}
