//
//  Tela02ViewController.swift
//  DesafioTransitandoInformacoesEntreTelas
//
//  Created by Fabio Cristiano Lopes on 17/07/24.
//

import UIKit

 
    class Tela02ViewController: UIViewController {

        @IBOutlet weak var resultLabel: UILabel!
        
      var resultTotal: String

      init?(coder: NSCoder, resultTotal: String) {
        
        self.resultTotal = resultTotal
        super.init(coder: coder)
      }

      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }

      override func viewDidLoad() {
        super.viewDidLoad()
          resultLabel.text = resultTotal.capitalized
      }

    }

