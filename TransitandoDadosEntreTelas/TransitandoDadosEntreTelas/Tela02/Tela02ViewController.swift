//
//  Tela02ViewController.swift
//  TransitandoDadosEntreTelas
//
//  Created by Fabio Cristiano Lopes on 17/07/24.
//

import UIKit

class Tela02ViewController: UIViewController {

  @IBOutlet weak var fullNameLabel: UILabel!

  let fullName: String

  init?(coder: NSCoder, fullName: String) {
    self.fullName = fullName
    super.init(coder: coder)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    fullNameLabel.text = fullName.capitalized
  }

}
