//
//  Tela02ViewController.swift
//  DesafioTransitandoInformacoesEntreTelas
//
//  Created by Fabio Cristiano Lopes on 17/07/24.
//

import UIKit

 
    class Tela02ViewController: UIViewController {

        @IBOutlet weak var resultLabel: UILabel!
        
      var resultButton: String

      init?(coder: NSCoder, resultButton: String) {
        self.resultButton = resultButton
        super.init(coder: coder)
      }

      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }

      override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultButton.capitalized
      }

    }
