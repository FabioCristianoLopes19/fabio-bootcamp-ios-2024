//
//  ViewController.swift
//  NavegacaoBootcamp2024
//
//  Created by Fabio Cristiano Lopes on 15/07/24.
//

import UIKit

// Passo a passo -> criando nova tela

// Criar arquivo Storyboard -> NovaTelaViewController
// Criar arquivo Swift com o mesmo nome do storyboard
//
// Colocar no Storyboard a classe de referencia -> link com seta (Embed In)
// Colocar no Storyboard para que seja is initial view controller (Na imagem de filtro) setinha que fica ao lado do simulador)
// Colocar identifier com o mesmo nome da classe (Imagem de cartão no campo Storyboard ID)


// MARK: - Navegação Modal

// modo de apresentação apenas para ser informativo/ selecionar um item e voltar para a tela anterior!!
// Casos de uso: Tela de selecionar contato -> tela de onboarding -> tela de termos de uso -> politica de privacidade, etc...

// Para apresetar uma nova tela, utilizamos o present
//  present(tela02, animated: true)

// Para voltar para a tela anterior com modal utilizamos o:
//  dismiss(animated: true)

// MARK: - Navegação NavigationController
// Primeira coisa para trabalhar com navigation é ter uma tela ROOT-> TELA RAIZ!

// Para apresetar uma nova tela, utilizamos o pushViewController
// navigationController?.pushViewController(tela02, animated: true)

// Para voltar para a tela anterior com navigation utilizamos o:
// navigationController?.popViewController(animated: true)

// Para voltar para a tela RAIZ utilizamos o:
//navigationController?.popToRootViewController(animated: true)



class Tela01ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Tela 01"
  }

  @IBAction func tappedShowScreenButton(_ sender: UIButton) {
    let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController")
//    tela02.modalPresentationStyle = .fullScreen

// Navegação Modal
//    present(tela02, animated: true)

// Navegação NavigationController
  navigationController?.pushViewController(tela02, animated: true)
  }
  
}

