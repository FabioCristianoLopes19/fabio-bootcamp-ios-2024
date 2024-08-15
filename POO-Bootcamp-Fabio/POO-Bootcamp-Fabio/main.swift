//
//  main.swift
//  POO-Bootcamp-Fabio
//
//  Created by Fabio Cristiano Lopes on 27/06/24.
//

import Foundation

//MARK: - Classe -> Modelo de um OBJETO!
// Atributo / Propriedades = caracteristicas de um objeto
// Ações = função / métodos
// CLASSE TRABALHA COM REFERENCE TYPE

// Como criar uma classe?
// Utilizamos a palavra reservada 'class' e na sequencia seu nome sendo, SEMPRE COM A PRIMEIRA LETRA MAIUSCULA.

class Automovel {

  let cor: String = "Vermelho"
  let quantidadeDeEspelho: Int = 5
  let marca: String = "Ferrari"
  let tipoCombustivel: String = "Alcool"
  let tipoMotor: String = "AP"
  let potencia: Double = 2.0
  let conversivel: Bool = true
  var cavaloDePotencia: Int = 900

  func ligarCarro() {
    print("O carro da marca \(marca) está ligado")
  }

  func acenderFarois() {
    print("As luzes estão ligadas")
  }

  func detalheCompletoAutomovel() -> String {
    let texto: String = "O veiculo da marca: \(marca) tem o motor: \(tipoMotor) que utiliza o combustivel \(tipoCombustivel) e tem um total de \(cavaloDePotencia) cavalos de potencia"
    return texto
  }

}


// Criando objeto!
// Um objeto só ganha VIDA, QUANDO GERAMOS A SUA INSTANCIA QUE É O ABRE E FECHA PARENTESES ()
var ferrari: Automovel = Automovel()

//print(ferrari.cavaloDePotencia)
//print(ferrari.cor)
//print(ferrari.conversivel)
//print(ferrari.detalheCompletoAutomovel())

// Para alterar uma propriedade, você precisa chamar o objeto e atribuir um novo valor a propriedade
ferrari.cavaloDePotencia = 1200
//print(ferrari.cavaloDePotencia)

var uno: Automovel = Automovel()
uno.cavaloDePotencia = 1500
//print(uno.cavaloDePotencia)


//MARK: - Construtores

class Pessoa {
  var nome: String
  var idade: Int
  var peso: Double
  var altura: Double

  // Método Construtor -> Ele é quem seta/informa os valores iniciais!!!
  init(nome: String, idade: Int, peso: Double, altura: Double) {
    self.nome = nome
    self.idade = idade
    self.peso = peso
    self.altura = altura
  }

}

// Neste exemplo, estamos gerando a instancia de uma forma diferente -> a instancia é gerada QUANDO preenchido todas as propriedades
// do metodo construtor
var caio: Pessoa = Pessoa(nome: "Caio", idade: 22, peso: 80, altura: 1.82)
//print(caio.idade)
//print(caio.peso)

var pedro: Pessoa = Pessoa(nome: "Pedro", idade: 45, peso: 92, altura: 1.77)
//print(pedro.idade)
//print(pedro.peso)

// Se caso NÃO TEM VALOR INICIAL, VOCÊ PRECISA PASSAR ELE NO INIT!!!!!!
class Celular {
  var valorPiCelular: Double = 3.14
  var tamanho: Double = 1.432432
  var cor: String
  var preco: Double
  var modelo: String

  init(modelo: String, preco: Double, cor: String) {
    self.modelo = modelo
    self.preco = preco
    self.cor = cor
  }
}

var iphone: Celular = Celular(modelo: "Iphone 15", preco: 8000, cor: "Preto")

//MARK: Se caso NÃO TEM VALOR INICIAL, VOCÊ PRECISA PASSAR ELE NO INIT!!!!!!
//MARK: O mesmo se encaixa para tipagens opcionais, POIS o opcional EXISTE ALGO DE INICIO -> QUE É O NIL! Com base nisso
//MARK: não é obrigado a passar ele no construtor. Mas caso queira, sem problemas!
class Bolo {

  var peso: Double
  var preco: Double
  var sabor: [String]
  var topoDeBolo: Bool? = nil

  init(peso: Double, preco: Double, sabor: [String]) {
    self.peso = peso
    self.preco = preco
    self.sabor = sabor
  }

  func adicionarSabor(sabor: String) {
    self.sabor.append(sabor)
  }
}

var boloAniversario: Bolo = Bolo(peso: 10, preco: 200, sabor: ["Chocolate", "Baunilha"])
var boloCasamento: Bolo = Bolo(peso: 50, preco: 2000, sabor: ["Chocolate", "Baunilha", "Maça"])

// MARK: - Exercicios Classe

// Exercício 1: Conta Poupança
// Objetivo: Desenvolver uma classe chamada 'ContaPoupanca' para gerenciar os depósitos em uma conta poupança de banco.
//
// Descrição:
// Propriedades:
// - saldo (Double): O saldo atual na conta.
// Construtor:
// - Inicialize o saldo.
// Métodos:
// - depositar(valor: Double): Adiciona(+) o valor especificado ao saldo atual. (saldo = saldo + valor especificado)
// - consultarSaldo() -> Double: Retorna o saldo atual da conta.

//   Para usar este método, você deve criar uma instância da classe, chamar este método e armazenar o valor retornado em uma variável. Em seguida, você pode imprimir esse valor.
// print("Saldo atual: R$\(saldoAtual)")

class ContaPoupanca {
  var saldo: Double

  init(saldo: Double) {
    self.saldo = saldo
  }

  func depositar(valor: Double) {
    saldo = saldo + valor
  }

  func consultarSaldo() -> Double {
    return saldo
  }
}

//var minhaConta: ContaPoupanca = ContaPoupanca(saldo: 500)
//print(minhaConta.consultarSaldo())
//minhaConta.depositar(valor: 2500)
//print(minhaConta.consultarSaldo())


// Exercício 2: Gerenciador de Filmes
// Objetivo: Desenvolver uma classe chamada 'Filme' para gerenciar informações sobre filmes em um acervo pessoal.
//
// Descrição:
// Propriedades:
// - titulo (String): O título do filme.
// - diretor (String): O diretor do filme.
// - ano (Int): O ano de lançamento do filme.
// Construtor:
// - Inicialize titulo, diretor e ano.
// Métodos:
// - exibirInfo() -> String: Retorna uma string com todas as informações do filme formatadas.

//   Para usar este método, crie uma instância da classe, chame o método e armazene a informação retornada em uma variável. Em seguida, imprima essa variável para visualizar os detalhes do filme.

class Filme {
  var titulo: String
  var diretor: String
  var ano: Int

  init(titulo: String, diretor: String, ano: Int) {
    self.titulo = titulo
    self.diretor = diretor
    self.ano = ano
  }

  func exibirInfo() -> String {
    return "O título é: \(titulo), e o diretor é: \(diretor) e o ano de lançamento foi em \(ano)"
  }
}


var topGun: Filme = Filme(titulo: "Top Gun", diretor: "Fabio Lopes", ano: 1983)
//print(topGun.exibirInfo())


// Exercício 3: Sistema de Registro de Alunos
// Objetivo: Criar uma classe chamada 'Aluno' para armazenar dados e calcular a média de notas de alunos em uma escola.
//
// Descrição:
// Propriedades:
// - nome (String): O nome do aluno.
// - notas (Array<Double>): Uma lista de notas do aluno.
// Construtor:
// - Inicialize nome e notas.
// Métodos:
// - calcularMedia() -> Double: Calcula e retorna a média das notas do aluno utilizando um laço de repetição para somar as notas.

//   Para utilizar este método, crie uma instância da classe, invoque o método para calcular a média, armazene esse valor em uma variável e imprima a média para visualizar.
// print("Média das notas de \(aluno.nome): \(media)")

class Aluno {

  var nome: String
  var notas: [Double]

  init(nome: String, notas: [Double]) {
    self.nome = nome
    self.notas = notas
  }

  func calcularMedia() -> Double {
    var soma: Double = 0
    for nota in notas {
      soma = soma + nota
    }
    return soma / Double(notas.count)
  }
}

var alunoHenry: Aluno = Aluno(nome: "Henry", notas: [8,8,9,10])
//print("Média das notas de \(alunoHenry.nome): \(alunoHenry.calcularMedia())")


// MARK: - Herança

// Classe PAI
class Animal {

  var nome: String
  var cor: String
  var peso: Double

  init(nome: String, cor: String, peso: Double) {
    self.nome = nome
    self.cor = cor
    self.peso = peso
  }
}

// Classe Filha(classe na qual HERDA as propriedades e metodos do pai)
// A classe filha ela contem TUDO OQUE O PAI (NO NOSSO EXEMPLO É A CLASSE ANIMAL) CONTEM, E + OQUE ELA JÁ CONTEM!
class Gato: Animal {

  var contemRabo: Bool = true
  var bebeLeite: Bool

  // toda a vez que você utilizar a palavra super, significa que você está chamando algo da classe PAI(no nosso exemplo, o init da classe Animal)
  init(bebeLeite: Bool, nome: String, cor: String, peso: Double) {
    self.bebeLeite = bebeLeite
    super.init(nome: nome, cor: cor, peso: peso)
  }

}

var bartolomeu: Gato = Gato(bebeLeite: true, nome: "Bartolomeu", cor: "Marrom", peso: 5)
//print (bartolomeu.bebeLeite)
//print (bartolomeu.nome)
//print (bartolomeu.cor)
//print (bartolomeu.peso)


// MARK: DesafioClasseHeranca
// MARK: - RESOLUÇÃO


// PARA QUE VOCÊS NÃO TENHAM PROBLEMA, A RESOLUÇÃO DE TODOS OS EXERCICIOS ESTÁ COM O NOME DAS CLASSES COM O FINAL 2 PARA QUE VOCÊS NÃO TENHAM PROBLEMA DE EXISTIR 2 CLASSES COM O MESMO NOME!




// Exercício 1: Controle de Estoque
// Objetivo: Criar uma classe chamada 'Produto' para gerenciar o estoque de produtos em uma loja.
//
// Descrição:
// Propriedades:
// - nome (String): O nome do produto.
// - quantidade (Int): Quantidade do produto em estoque.
// Construtor:
// - Inicialize nome e quantidade.
// Métodos:
// - adicionarEstoque(qtd: Int): Adiciona a quantidade especificada ao estoque existente.
// - removerEstoque(qtd: Int) -> Bool: Tenta remover a quantidade especificada do estoque; retorna true se for bem-sucedido, false se não houver estoque suficiente.
class Produto2 {
  var nome: String
  var quantidade: Int

  init(nome: String, quantidade: Int) {
    self.nome = nome
    self.quantidade = quantidade
  }

  func adicionarEstoque(qtd: Int) {
//    quantidade = quantidade + qtde (ou)
//      quantidade += qtde
  }

  func removerEstoque(quantidadeItensRemovidos: Int) -> Bool {
    if quantidade >= quantidadeItensRemovidos {
//      quantidade = quantidade - quantidadeItensRemovidos (ou)
        quantidade -= quantidadeItensRemovidos
      return true
    } else {
      return false
    }
  }
}

//let iphone: Produto2 = Produto2 (nome: "Iphone", quantidade: 10)
//let conseguiRemover: Bool = iphone.removerEstoque(quantidadeItensRemovidos: 3)
//print(conseguiRemover)

// Exercício 2: Sistema de Agendamento de Consultas
// Objetivo: Criar uma classe chamada 'Consulta' para gerenciar agendamentos médicos.
//
// Descrição:
// Propriedades:
// - paciente (String): Nome do paciente.
// - data (String): Data agendada para a consulta.
// Construtor:
// - Inicialize paciente e data.
// Métodos:
// - reagendar(dataNova: String): Altera a data da consulta para uma nova data fornecida.
class Consulta2 {
  var paciente: String
  var data: String

  init(paciente: String, data: String) {
    self.paciente = paciente
    self.data = data
  }

  func reagendar(dataNova: String) {
    data = dataNova
  }
}

// Exercício 3: Monitoramento de Velocidade
// Objetivo: Desenvolver uma classe chamada 'Veiculo' que monitora a velocidade atual e verifica se está acima do limite.
//
// Descrição:
// Propriedades:
// - velocidadeAtual (Double): A velocidade atual do veículo em km/h.
// - limiteVelocidade (Double): O limite de velocidade em km/h.
// Construtor:
// - Inicialize a velocidadeAtual e limiteVelocidade.
// Métodos:
// - verificarVelocidade() -> String: Retorna uma mensagem indicando se o veículo está acima do limite de velocidade ou não.
class Veiculo2 {
  var velocidadeAtual: Double
  var limiteVelocidade: Double

  init(velocidadeAtual: Double, limiteVelocidade: Double) {
    self.velocidadeAtual = velocidadeAtual
    self.limiteVelocidade = limiteVelocidade
  }

  func verificarVelocidade() -> String {
    if velocidadeAtual > limiteVelocidade {
      return "Velocidade acima do limite!"
    } else {
      return "Velocidade dentro do limite."
    }
  }
}

// Exercício 4: Sistema de Reservas de Salas
// Objetivo: Criar uma classe chamada 'Sala' para gerenciar as reservas de salas em um centro de conferências.
//
// Descrição:
// Propriedades:
// - numero (Int): Número da sala.
// - reservada (Bool): Indica se a sala está reservada.
// Construtor:
// - Inicialize numero e começe com reservada definido como false.
// Métodos:
// - reservar(): Altera o estado de 'reservada' para true.
// - liberar(): Altera o estado de 'reservada' para false.
class Sala2 {
  var numero: Int
  var reservada: Bool

  init(numero: Int) {
    self.numero = numero
    self.reservada = false
  }

  func reservar() {
    reservada = true
  }

  func liberar() {
    reservada = false
  }
}

// Exercício 5: Gerenciador de Perfis de Usuário
// Objetivo: Desenvolver uma classe chamada 'Usuario' para gerenciar as informações de perfil dos usuários de um sistema.
//
// Descrição:
// Propriedades:
// - nomeUsuario (String): Nome de usuário.
// - email (String): Email do usuário.
// - ativo (Bool): Indica se o perfil do usuário está ativo.
// Construtor:
// - Inicialize nomeUsuario, email e comece com ativo definido como true.
// Métodos:
// - desativarPerfil(): Altera o estado de 'ativo' para false, desativando o perfil do usuário.
class Usuario2 {
  var nomeUsuario: String
  var email: String
  var ativo: Bool

  init(nomeUsuario: String, email: String) {
    self.nomeUsuario = nomeUsuario
    self.email = email
    self.ativo = true
  }

  func desativarPerfil() {
    ativo = false
  }
}



// Exercício 6: Sistema de VeiculosPotentes
// Objetivo: Criar uma classe base chamada 'VeiculosPotentes' e duas subclasses 'Carro' e 'Motocicleta' que herdem de 'Veiculo'.
//
// Descrição:
// Classe Base:
// - Veiculo
// Propriedades:
// - marca (String)
// - modelo (String)
// - ano (Int)
// Construtor:
// - Inicialize marca, modelo e ano.
// Subclasses:
// - Carro: Adiciona a propriedade 'numeroDePortas' (Int).
// - Motocicleta: Adiciona a propriedade 'cilindrada' (Int).
class VeiculosPotentes2 {
    var marca: String
    var modelo: String
    var ano: Int

    init(marca: String, modelo: String, ano: Int) {
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
    }
}

class Carro2: VeiculosPotentes2 {
    var numeroDePortas: Int

    init(marca: String, modelo: String, ano: Int, numeroDePortas: Int) {
        self.numeroDePortas = numeroDePortas
        super.init(marca: marca, modelo: modelo, ano: ano)
    }
}

class Motocicleta2: VeiculosPotentes2 {
    var cilindrada: Int

    init(marca: String, modelo: String, ano: Int, cilindrada: Int) {
        self.cilindrada = cilindrada
        super.init(marca: marca, modelo: modelo, ano: ano)
    }
}

// Exercício 7: Hierarquia Acadêmica
// Objetivo: Desenvolver uma classe 'Pessoa' e duas subclasses 'Aluno' e 'Professor' que herdem de 'Pessoa'.
//
// Descrição:
// Classe Base:
// - Pessoa
// Propriedades:
// - nome (String)
// - idade (Int)
// Construtor:
// - Inicialize nome e idade.
// Subclasses:
// - Aluno: Adiciona a propriedade 'curso' (String).
// - Professor: Adiciona a propriedade 'departamento' (String).
class Pessoa2 {
    var nome: String
    var idade: Int

    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
}

class Aluno2: Pessoa2 {
    var curso: String

    init(nome: String, idade: Int, curso: String) {
        self.curso = curso
        super.init(nome: nome, idade: idade)
    }
}

class Professor2: Pessoa2 {
    var departamento: String

    init(nome: String, idade: Int, departamento: String) {
        self.departamento = departamento
        super.init(nome: nome, idade: idade)
    }
}

// Exercício 8: Sistema de Organização de Conteúdo
// Objetivo: Criar uma classe 'ConteudoDigital' e duas subclasses 'Video' e 'Artigo' que herdem de 'ConteudoDigital'.
//
// Descrição:
// Classe Base:
// - ConteudoDigital
// Propriedades:
// - titulo (String)
// - autor (String)
// Construtor:
// - Inicialize titulo e autor.
// Subclasses:
// - Video: Adiciona a propriedade 'duracao' (Int, em minutos).
// - Artigo: Adiciona a propriedade 'numeroDePalavras' (Int).
class ConteudoDigital2 {
    var titulo: String
    var autor: String

    init(titulo: String, autor: String) {
        self.titulo = titulo
        self.autor = autor
    }
}

class Video2: ConteudoDigital2 {
    var duracao: Int

    init(titulo: String, autor: String, duracao: Int) {
        self.duracao = duracao
        super.init(titulo: titulo, autor: autor)
    }
}

class Artigo2: ConteudoDigital2 {
    var numeroDePalavras: Int

    init(titulo: String, autor: String, numeroDePalavras: Int) {
        self.numeroDePalavras = numeroDePalavras
        super.init(titulo: titulo, autor: autor)
    }
}

// Exercício 9: Hierarquia de Imóveis
// Objetivo: Criar uma classe 'Imovel' e duas subclasses 'Casa' e 'Apartamento' que herdem de 'Imovel'.
//
// Descrição:
// Classe Base:
// - Imovel
// Propriedades:
// - endereco (String)
// - preco (Double)
// Construtor:
// - Inicialize endereco e preco.
// Subclasses:
// - Casa: Adiciona a propriedade 'tamanhoDoTerreno' (Double, em metros quadrados).
// - Apartamento: Adiciona a propriedade 'andar' (Int).
class Imovel2 {
    var endereco: String
    var preco: Double

    init(endereco: String, preco: Double) {
        self.endereco = endereco
        self.preco = preco
    }
}

class Casa2: Imovel2 {
    var tamanhoDoTerreno: Double

    init(endereco: String, preco: Double, tamanhoDoTerreno: Double) {
        self.tamanhoDoTerreno = tamanhoDoTerreno
        super.init(endereco: endereco, preco: preco)
    }
}

class Apartamento2: Imovel2 {
    var andar: Int

    init(endereco: String, preco: Double, andar: Int) {
        self.andar = andar
        super.init(endereco: endereco, preco: preco)
    }
}

// Exercício 10: Cadeia de Restaurantes
// Objetivo: Desenvolver uma classe 'Restaurante' e duas subclasses 'RestauranteFastFood' e 'RestauranteGourmet' que herdem de 'Restaurante'.
//
// Descrição:
// Classe Base:
// - Restaurante
// Propriedades:
// - nome (String)
// - localizacao (String)
// Construtor:
// - Inicialize nome e localização.
// Subclasses:
// - RestauranteFastFood: Adiciona a propriedade 'tempoMedioDeEntrega' (Int, em minutos).
// - RestauranteGourmet: Adiciona a propriedade 'chef' (String).
class Restaurante2 {
    var nome: String
    var localizacao: String

    init(nome: String, localizacao: String) {
        self.nome = nome
        self.localizacao = localizacao
    }
}

class RestauranteFastFood2: Restaurante2 {
    var tempoMedioDeEntrega: Int

    init(nome: String, localizacao: String, tempoMedioDeEntrega: Int) {
        self.tempoMedioDeEntrega = tempoMedioDeEntrega
        super.init(nome: nome, localizacao: localizacao)
    }
}

class RestauranteGourmet2: Restaurante2 {
    var chef: String

    init(nome: String, localizacao: String, chef: String) {
        self.chef = chef
        super.init(nome: nome, localizacao: localizacao)
    }
}



// MARK: - Encapsulamento
// O encapsulamento é a prática de manter os detalhes de implementação de um objeto escondidos e seguros de acesso externo. Isso é feito usando modificadores de acesso para restringir o acesso às propriedades e métodos de uma classe.
// De criar variaveis/função get e set
// get -> pegar/acessar/consultar valor
// set -> setar novo valor/substituir o valor atual por um novo
// Tudo que você coloca sendo private -> ele só existe dentro daquele bloco!!

class Computador {
  private var armazenamento: Int
  var processador: String
  var memoriaRam: Int

  init(processador: String, armazenamento: Int, memoriaRam: Int) {
    self.processador = processador
    self.armazenamento = armazenamento
    self.memoriaRam = memoriaRam
  }

  // função set
  func melhoriaArmazenamento(armazenamentoNovo: Int) {
    if validaNovoArmazenamento(novoArmazenamento: armazenamentoNovo) {
      armazenamento = armazenamentoNovo
    }
  }

  // função get
  func getArmazenamento() -> Int {
    return armazenamento
  }

  private func validaNovoArmazenamento(novoArmazenamento: Int) -> Bool {
    let eValido: Bool = armazenamento < novoArmazenamento
    return eValido
  }
}

var meuComputador: Computador = Computador(processador: "m1", armazenamento: 10, memoriaRam: 10)

// Quando declaramos uma função ou variaveis que sejam private, você não consegue chama-las ou atribuir um novo valor fora do bloco de codigo onde ela se mantem.
// meuComputador.armazenamento

// set
meuComputador.melhoriaArmazenamento(armazenamentoNovo: 20)

// get
//print(meuComputador.getArmazenamento())



// MARK: - Polimorfismo
// O polimorfismo permite que objetos de diferentes classes sejam tratados como objetos de uma classe comum. Em outras palavras, polimorfismo permite que um método tenha muitas "formas" diferentes, dependendo do objeto que o chama.
// override -> sobrescrever -> substituir


// O polimorfismo, é nada mais, nada menos que quando se tem uma classe FILHA e você quer utilizar o mesmo nome ou função da classe pai, você precisa colocar o override.
// Segue o exemplo:

class Veiculo {
  var velocidadeMaxima: Int

  init(velocidadeMaxima: Int) {
    self.velocidadeMaxima = velocidadeMaxima
  }

  func detalhesDoVeiculo() -> String {
    return "Veiculos com velocidade máxima de \(velocidadeMaxima) hm/h"
  }
}

class Carro: Veiculo {


  override func detalhesDoVeiculo() -> String {
    return "Carros com velocidade máxima de \(velocidadeMaxima) hm/h"
  }

// Neste exemplo estamos chamando a funcao da classe pai para que a gente possa aprender que com a palavra reservada super, ela chama SEMPRE TUDO OQUE É DA CLASSE PAI
//  override func detalhesDoVeiculo() -> String {
//    let detalhes: String = super.detalhesDoVeiculo()
//    return "\(detalhes) teste agora vai"
//  }
}

//var corolla: Carro = Carro(velocidadeMaxima: 10)
//print(corolla.detalhesDoVeiculo())

// MARK: - Struct
// Com a struct, não é obrigatorio deixar o construtor de forma explicita
// Struct NÃO ACEITA HERENÇA!!!
// Struct aceita apenas PROTOCOLO em sua hierarquia!!
// Struct trabalha com VALUE TYPE!!!

struct Documento {
  var quantidadeDeFolhas: Int
  var tipo: String

  init(quantidadeDeFolhas: Int, tipo: String) {
    self.quantidadeDeFolhas = quantidadeDeFolhas
    self.tipo = tipo
  }
}

var minhaCNH: Documento = Documento(quantidadeDeFolhas: 5, tipo: "muito cara")
var meuRG: Documento = Documento(quantidadeDeFolhas: 2, tipo: "documento importante")

//print("quantidadeDeFolhas CNH: \(minhaCNH.quantidadeDeFolhas)")
//print("quantidadeDeFolhas RH: \(meuRG.quantidadeDeFolhas)")
//
//print("---------------------------------------------------------")

minhaCNH = meuRG

//print("quantidadeDeFolhas CNH: \(minhaCNH.quantidadeDeFolhas)")
//print("quantidadeDeFolhas RH: \(meuRG.quantidadeDeFolhas)")
//
//print("---------------------------------------------------------")

minhaCNH.quantidadeDeFolhas = 50
meuRG.quantidadeDeFolhas = 100

//print("quantidadeDeFolhas CNH: \(minhaCNH.quantidadeDeFolhas)")
//print("quantidadeDeFolhas RH: \(meuRG.quantidadeDeFolhas)")


// struct

//quantidadeDeFolhas CNH: 5
//quantidadeDeFolhas RH: 2
//---------------------------------------------------------
//quantidadeDeFolhas CNH: 2
//quantidadeDeFolhas RH: 2
//---------------------------------------------------------
//quantidadeDeFolhas CNH: 50
//quantidadeDeFolhas RH: 100

// class

//quantidadeDeFolhas CNH: 5
//quantidadeDeFolhas RH: 2
//---------------------------------------------------------
//quantidadeDeFolhas CNH: 2
//quantidadeDeFolhas RH: 2
//---------------------------------------------------------
//quantidadeDeFolhas CNH: 100
//quantidadeDeFolhas RH: 100

// MARK: - Inicializadores / Construtores

class Casa {

  var numeroDeQuartos: Int
  var localizacao: String

  // Designated Initializer
  // Inicializador principal que deve configurar todas as propriedades.
  init(numeroDeQuartos: Int, localizacao: String) {
    self.numeroDeQuartos = numeroDeQuartos
    self.localizacao = localizacao
  }

  // Convenience Initializer
  // Inicializador secundário que fornece valores padrão ou simplifica a criação da instância.
  convenience init() {
    self.init(numeroDeQuartos: 5, localizacao: "guaruja")
  }

  convenience init(numeroDeQuartos: Int) {
    self.init(numeroDeQuartos: numeroDeQuartos, localizacao: "guaruja")
  }

  // Failable Initializer
  // Inicializador que pode falhar e retornar nil se as condições não forem atendidas.
  init?(numeroDeQuartos: Int, localizacao: String, validaQuartos: Bool) {
    if validaQuartos == false || numeroDeQuartos < 2 {
      return nil
    }
    self.numeroDeQuartos = numeroDeQuartos
    self.localizacao = localizacao
  }

  // Required Initializer
  // Exige que todas as subclasses implementem este inicializador.
  required init(localizacao: String) {
    self.localizacao = localizacao
    self.numeroDeQuartos = 10
  }
}

var minhaCasa: Casa = Casa(numeroDeQuartos: 10, localizacao: "nuporanga")
var minhaCasa2: Casa = Casa()
var minhaCasa3: Casa = Casa(numeroDeQuartos: 20)
var minhaCasa4: Casa = Casa(numeroDeQuartos: 0, localizacao: "", validaQuartos: false) ?? Casa()


class CasaDePraia: Casa {

  var distanciaDaPraia: Int

  init(distanciaDaPraia: Int) {
    self.distanciaDaPraia = distanciaDaPraia
    super.init(numeroDeQuartos: 10, localizacao: "sp")
  }
  
  required init(localizacao: String) {
    self.distanciaDaPraia = 1000
    super.init(numeroDeQuartos: 100, localizacao: localizacao)
  }
}

//var minhaCasaDePraia: CasaDePraia = CasaDePraia(distanciaDaPraia: 100)
var minhaCasaDePraia2: CasaDePraia = CasaDePraia(localizacao: "sp")



