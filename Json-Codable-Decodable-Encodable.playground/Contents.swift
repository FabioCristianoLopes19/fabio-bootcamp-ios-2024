import UIKit

// MARK: Oque é um JSON?

// JSON, que significa JavaScript Object Notation, é um formato leve de intercâmbio de dados. É fácil para os seres humanos lerem e escreverem, e fácil para máquinas analisarem e gerarem. É baseado em um subconjunto da linguagem de programação JavaScript, mas é independente de linguagem, sendo amplamente usado em muitas linguagens de programação, incluindo Swift, para armazenamento e troca de dados.(Usamos a ferramenta Visual Studio Code).

// Um JSON é construído com dois tipos de estruturas:

// 1 -> Objeto: Um objeto JSON é uma coleção de pares chave/valor, onde a chave deve ser um STRING, e o valor pode ser uma string, número, booleano, uma lista, outro objeto... Objeto JSON são declarados por ABERTURA E FECHAMENTO DE CHAVES { }

// 2 -> Arrays: Um array JSON é uma lista ordenada de valores(string, número, booleano, uma lista, outro objeto...). Arrays são declarados por colchetes [ ]


// Exemplo OBJETO

//{
//  "nome": "Caio Fabrini",
//  "idade": 22,
//  "professor": true,
//  "cursos": ["iOS", "Swift", "SwiftUI"],
//  "endereco": {
//    "cidade": "Nuporanga",
//    "estado": "SP"
//  }
//}

// Modelo do JSON
struct Professor {
  var nome: String
  var idade: Int
  var professor: Bool
  var cursos: [String]
  var endereco: Endereco
}

struct Endereco {
  var cidade: String
  var estado: String
}

//{
//    "pessoa": {
//        "nome": "guilherme",
//        "idade": 17,
//        "sobrenome" : "Braganca"
//      }
//}

struct MinhaSogra {
  var pessoa: Pessoa
}

struct Pessoa {
  var nome: String
  var idade: Int
  var sobrenome: String
}

// Exemplo LISTA

//[
//   {
//    "nome": "Caio",
//    "idade": 22
//   },
//   {
//    "nome": "Matheus",
//    "idade": 25
//   },
//   {
//    "nome": "Lucas",
//    "idade": 32
//   }
//]

struct Aluno {
  var nome: String
  var idade: Int
}

var listaAluno: [Aluno] = [
  Aluno(nome: "Caio", idade: 22),
  Aluno(nome: "Matheus", idade: 25),
  Aluno(nome: "Lucas", idade: 32),
]


// Exercicios


// 1 - Escreva um JSON que represente uma lista com dois objetos do tipo Pessoa, onde o primeiro tem nome “Ana” e idade 28, e o segundo, nome “Ricardo” e idade 35.

//[
//    {
//        "nome": "Ana",
//        "idade": 28
//    },
//    {
//        "nome": "Ricardo",
//        "idade": 35
//    }
//]

// 2 - Crie um JSON que represente um array de objetos, cada um representando um produto com id, nome e preço. Inclua pelo menos três produtos no array. Por fim, crie um modelo swift desse Json, e alem disso tambem crie um objeto com os valores iguais ao do json.

//JSON:
//[
//    {
//        "id": 1,
//        "nome": "Caneta",
//        "preco": 6.25
//    },
//
//    {
//        "id": 2,
//        "nome": "Lápis",
//        "preco": 2.10
//    },
//
//    {
//        "id": 3,
//        "nome": "Estojo",
//        "preco": 15.30
//    }
//]

//struct ProdutosEscolares: {
//    var id: Int
//    var nome: String
//    var preco: Double
//}
//
//var listaProdutosEscolares: [ProdutosEscolares] = [
//    Produtos (id: 1, nome: "Caneta", preco: 6.25)
//    Produtos (id: 2, nome: "Lápis", preco: 2.10)
//    Produtos (id: 3, nome: "Estojo", preco: 15.30)
//]

//
// 3 - Crie um JSON representando o objeto Veiculo fornecido em Swift

struct Veiculo {
    var id: Int
    var marca: String
    var modelo: String
    var ano: Int
    var acessorios: [Acessorio]
}

struct Acessorio {
    var nome: String
    var preco: Double
    var configuracaoAcessorio: ConfiguracaoAcessorio
}

struct ConfiguracaoAcessorio {
    var tipo: String
    var dataCriacao: String
}

// Objeto com valores
let veiculo = Veiculo(
    id: 101,
    marca: "Toyota",
    modelo: "Corolla",
    ano: 2022,
    acessorios: [
        Acessorio(
            nome: "Teto solar",
            preco: 2500.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Luxo",
                dataCriacao: "2021-06-15"
            )
        ),
        Acessorio(
            nome: "Multimídia",
            preco: 1200.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Tecnologia",
                dataCriacao: "2021-08-20"
            )
        )
    ]
)


//JSON
//{
//  "id": 101,
//  "marca": "Toyota",
//  "modelo": "Corolla",
//  "ano": 2022,
//  "acessorios": [
//    {
//      "nome": "Teto solar",
//      "preco": 2500.00,
//      "configuracaoAcessorio": {
//        "tipo": "Luxo",
//        "dataCriacao": "2021-06-15"
//      }
//    },
//    {
//      "nome": "Multimídia",
//      "preco": 1200.00,
//      "configuracaoAcessorio": {
//        "tipo": "Tecnologia",
//        "dataCriacao": "2021-08-20"
//      }
//    }
//  ]
//}

