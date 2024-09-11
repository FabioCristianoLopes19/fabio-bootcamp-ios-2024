//
//  main.swift
//  GenericBootcamp
//
//  Created by Fabio Cristiano Lopes on 11/09/24.
//

import Foundation

// O que são Genéricos?

// Imagine que você tem uma caixa mágica que pode guardar qualquer coisa: um brinquedo, um livro ou uma fruta. Essa caixa não precisa ser uma caixa de brinquedos ou uma caixa de livros. Ela é genérica, ou seja, ela pode guardar qualquer coisa.

// No Swift, os genéricos são como essa caixa mágica. Eles permitem criar funções e estruturas que podem trabalhar com qualquer tipo de dado, sem precisar especificar um tipo específico (como Int, String, etc.).

// Por que usar Genéricos?

//Sem genéricos, você teria que criar funções separadas para cada tipo de dado, já sendo generic você pode utilizar uma para qualquer coisa!

// MARK: Exemplo de classe com propriedade generica passando pelo construtor.
class Caixa<Valor> {

  var item: Valor

  init(item: Valor) {
    self.item = item
  }

  func mostrarItem() {
     print("O item na caixa é: \(item)")
  }
}

let caixaDeNumero = Caixa(item: 45)
let caixaDeTexto =  Caixa(item: "Caio Fabrini")
caixaDeNumero.mostrarItem()
caixaDeTexto.mostrarItem()

// MARK: Função com generico
// OBS: Toda a vez que formos trabalhar com o tipo generico, precisamos informar o metodo/clase com sinal de menor e maior com a letra generica no meio!
func mostrarConteudo<T>(conteudo: T) {
    print("Conteudo: \(conteudo)")
}

mostrarConteudo(conteudo: "Olá mundo")
mostrarConteudo(conteudo: 34)
mostrarConteudo(conteudo: true)

// Tratamento para generico

func mostrarConteudoIfLet<T>(conteudo: T) {
  if let numero = conteudo as? Int {
    print("Isso é um numero inteiro: \(numero)")
  } else if let texto = conteudo as? String {
    print("Isso é um texto: \(texto)")
  } else if let decimal = conteudo as? Double {
    print("Isso é um numero decimal: \(decimal)")
  } else {
    print("Outro tipo não validado: \(conteudo)")
  }
}

mostrarConteudoIfLet(conteudo: "Olá mundo")
mostrarConteudoIfLet(conteudo: 22)
mostrarConteudoIfLet(conteudo: 1.45)

func mostrarConteudoSwitchCase<T>(conteudo: T) {
  switch conteudo {
  case let numero as Int:
    print("Isso é um numero inteiro: \(numero)")
  case let texto as String:
    print("Isso é um texto: \(texto)")
  case let decimal as Double:
    print("Isso é um numero decimal: \(decimal)")
  default:
    print("Outro tipo não validado: \(conteudo)")
  }
}


