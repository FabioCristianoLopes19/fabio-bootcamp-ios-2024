//
//  main.swift
//  Funcoes
//
//  Created by Fabio Cristiano Lopez on 10/06/24.
//

import Foundation

// MARK: - Funções / Métodos

// Uma função é um bloco de código que executa algo e que pode ser reutilizavel quando quiser.
// Uma função executa tudo aquilo que está dentro do bloco de codigo (entre as chaves { } )
// Uma função tem 3 tipos
// Função sem parametro e sem retorno
// Função com parametro e sem retorno
// Função com parametro e com retorno

// Como criar uma função:
// Informe a palavra reservada func e na sequencia informe o nome da função (o nome da função é uma das parte mais importantes da função, pois ela tem que deixar claro exatamente oque ela vai executar).
// Abra e feche os parenteses, caso tenha parametros os informe, caso constrario não.
// ->
// Abra e feche as chaves


//MARK: Função sem retorno e sem parametro

func exibirNomes() {
  print("Meu nome é caio")
  print("Meu nome é caio")
  print("Meu nome é caio")
  print("Meu nome é caio")
  print("Meu nome é caio")
}
//Obs.: combando abaixo a função
//exibirNomes()


func ligarMotor() {
  print("O motor está ligado")
}
//combando abaixo chama a função
//ligarMotor()

//MARK: Função sem retorno e com parametro
// Quando utilizar parametros?
// Quando sua função precisa daquela informação que está de forma externa.
// Uma função com parametros ela consegue ser escalavel e reutilizavel em outros locais.

func soma(valor1: Int, valor2: Int) {
    let somaTotalExemplo: Int = valor1 + valor2
  print("O resultado da soma é \(somaTotalExemplo)")
}
//Obs.: combando abaixo a função
//soma(valor1: 20, valor2: 30)

//Treinamento

func somaTreino (valorT1: Int, valorT2: Int) {
        let resultadoSomaTreino: Int = valorT1 + valorT2
        print(resultadoSomaTreino)
    
}
//Obs.: combando abaixo a função
//somaTreino(valorT1: 10, valorT2: 15)

func nomeCompletoExemplo(primeiroNome: String, ultimoNome: String) {
    let nomeCompleto1: String = primeiroNome + " " + ultimoNome
  print("Meu nome completo é: \(nomeCompleto1)")
}
//nomeCompletoExemplo(primeiroNome: "Caio", ultimoNome: "Fabrini")


func descricaoTrabalho(nome: String, idade: Int, descricao: String, salario: Double, clt: Bool) {
//    print("Meu nome é: \(nome), tenho \(idade) anos e trabalho com \(descricao). Atualmente tenho o salario de R$ \(salario) e sou resgistrado: \(clt)")
}
descricaoTrabalho(nome: "Caio", idade: 22, descricao: "Sou dev iOS em um dos maiores bancos da america latina", salario: 1000, clt: true)


func somaDouble(valor1: Int, valor2: Int, valor3: Double) {
    let somaTotal:Double = Double(valor1) + Double(valor2) + valor3
//  print("O resultado da soma é \(somaTotal)")
}
somaDouble(valor1: 10, valor2: 20, valor3: 20.5)


func minhaIdade(_ idade: Int) {
//  print("Minha idade é \(idade)")
}
// sem _
// minhaIdade(idade: 22)
// com _ (oculta nome do parametro Exemplo: idade)
// minhaIdade(22)


func descontoTotalCompra(valorTotal: Double, pagamentoCartao: Bool? = nil) {
  print("O valor total da compra é de \(valorTotal) e a forma de pagamento é no cartão: \(pagamentoCartao ?? false)")
}
//descontoTotalCompra(valorTotal: 1500)
//descontoTotalCompra(valorTotal: 200, pagamentoCartao: true)



//MARK: Função com retorno e sem parametro

func meuNomeE() -> String {
    return "Caio Fabrini"
}
let meuNomeString: String = meuNomeE()
print(meuNomeString)



//MARK: Função com retorno e com parametro

func divisao(valor1: Double, valor2: Double) -> Double {
    let valorTotal = valor1 / valor2
    return valorTotal
}
//chamando a função
var resultadoDivisao: Double = divisao(valor1: 100, valor2: 10)
//print("O resultado da divisao é de: \(resultadoDivisao)")


func maiorNumero(valor1: Double, valor2: Double) -> String {
  let frase = "O valor1 é maior que o valor2: \(valor1 > valor2)"
  return frase
}
//chamando a função
let fraseMaiorNumero: String = maiorNumero(valor1: 100, valor2: 200)
//print(fraseMaiorNumero)

