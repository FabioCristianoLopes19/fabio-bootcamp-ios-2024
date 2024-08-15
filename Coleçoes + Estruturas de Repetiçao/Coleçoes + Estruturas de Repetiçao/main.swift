//
//  main.swift
//  Coleçoes + Estruturas de Repetiçao
//
//  Created by Fabio Cristiano Lopez on 17/06/24.
//

import Foundation

//MARK: Coleções -> tipagens que armazenam nenhum ou varios valores

//MARK: Ponto importante
// Uma tipagem simples, ela armazena apenas um unico valor!! Já um dicionario/array podem armazenar nenhum ou muitooos valores!!!

//MARK: - Array -> lista de valores de uma devida tipagem

// Criação de um array:
// var listaNome: -> colocamos a nossa tipagem sempre estre os colchetes [Tipo da tipagem]
// Quando trabalhamos com array, o valor SEMPRE deve estar entre colchetes = ["Caio", "Gabriela", "Giulia", "Ramon"]
// Qual a tipagem que um array pode ter? QUALQUER TIPAGEM!!!!
// Quantos valores pode conter em um array? NÃO TEMOS LIMITE!!!

// Caracteristicas de um array:
// Um array trabalha de forma ORDENADA!!!
// Suas posições não se alteram
// Por trabalhar de forma ordenada, o array tem algo que chamamos de INDEX, que nada mais é que suas posições
// Na programação a primeira posição não é o 1 e sim o 0!!

//                                0         1        2          3       4         5         6
//var diasDaSemana: [String] = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
//
//let nome: String = "Meu nome é Caio"
//var listaNotas: [Double] = [10, 5.5, 9.8, 3, 2, 10, 8.5]
//let livrosQueLi: [String] = ["Diario de um banana", "Diario de um banana 2"]
//var listaNomes: [String] = ["Caio", "Gabriela", "Giulia", "Ramon"]
//var listaVazia: [Int] = []


// Para acessar um valor de um array utilizamos o INDEX DO ARRAY

//var dia: String = diasDaSemana[5]
//print("Hoje é: \(dia)")

//var nota: Double = listaNotas[1]
//print("Sua nota é: \(nota)")

// Verificar quantos ITENS EXISTE EM UM ARRAY
//let quantidadeTotalDeAlunos: Int = listaNomes.count
//print(quantidadeTotalDeAlunos)

// Verificar se a lista é vazia
//let eVazio: Bool = listaVazia.isEmpty
//print(eVazio)
//print(listaNomes.isEmpty)

// Para adicionar um novo item no seu array utilizamos a propriedade append
// OBS: Para adicionar um item no seu array ele DEVE SER DA MESMA TIPAGEM DO ARRAY!!!!!
// Toda a vez que utilizamos o append, o novo elemento é adicionado sempre ao final da lista

//listaNomes.append("Thiago")
//listaNomes.append("Fabio")
//listaNomes.append("Gabriela")
//print(listaNomes)

//listaNotas.append(1.5)
//print(listaNotas)

// Para deletar um elemento do array utilizamos a propriedade remove, e temos 4 formas SIMPLES:

// Remove TODOS os itens do array
//listaNomes.removeAll()
//print(listaNomes)

// Remove o ultimo item do array
//listaNomes.removeLast()
//print(listaNomes)

// Remove o primeiro item do array
//listaNomes.removeFirst()
//print(listaNomes)

// Remove uma posição ESPECIFICA do array
//listaNomes.remove(at: 5)
//print(listaNomes)


// MARK: - Dicionario -> chave e valor
// O dicionario trabalha como LISTA, porem diferente do array ele NÃO É ORDENADO!!
// O dicionario NÃO IMPORTA COM A ORDEM!
// A referencia do array é o index(posição), já o dicionário é a chave!

// Caracteristicas de um dicionario:
// Ele trabalha com chave e valor
// Para criar um dicionario colocamos entre colchetes sua chave e sua tipagem(valor do dicionario) Ex: [chave/key: valor/value]
// O dicionario pode ter qualquer tipagem de valor, podendo ser double, float, int, string, bool, etc...
// Toda a vez que vocês forem utilizar um dicionario sempre deve utilizar os dois pontos para separar oque é chave de valor
// Sua chave, jamais se repete!!

//            key     value      key   value   key        value  key       value
//var altura: [String: Double] = ["Caio": 1.82, "Guilherme": 1.75, "Marcello": 1.70]
//print(altura)


// para adicionar/atualizar um item do dicionario utilizamos a propriedade updateValue
// quando utilizamos o updateValue ele SEMPRE vai validar se a chave que você informou já existe,
// se sim, atualiza o valor dela, caso contrario ele cria um novo item!

//altura.updateValue(1.90, forKey: "Ramon")
//altura.updateValue(1.90, forKey: "Caio2")

//print(altura)


// Para acessar um valor de um dicionario, utilizamos sua chave
//let minhaAltura: Double = altura["Guilherme"] ?? 0
//print(minhaAltura)

// Remover um item de um dicionario

// remover todos os itens
//altura.removeAll()

// Remover chave especifica
//altura.removeValue(forKey: "Guilherme")
//print(altura)

// Remover chave especifica e colocar nome que não consta na lista. A exclusão não é realizado
//altura.removeValue(forKey: "Guilherme2")
//print(altura)

//MARK: - Exercicios Array e Dicionário

//Exercício 1: Arrays
//Crie um array contendo os nomes de três aplicativos iOS populares. Imprima o nome do segundo aplicativo na lista.

//let appsPopulares: [String] = ["Ifood", 
//                               "Santander",
//                               "Uber"]
//let app: String = appsPopulares[1]
//print(app)

//Exercício 2: Dicionários
//Crie um dicionário com os nomes de três pessoas como chaves e seus sobrenomes como valores. Imprima um de seus valores.
//var nomesCompletos: [String: String] = ["Fabio": "Lopes", 
//                                        "Louise": "Vital",
//                                        "Henry": "Hebert"]
//print(nomesCompletos["Louise"])


//Exercício 3: Manipulação de Arrays
//Crie um array contendo 10 números inteiros. Adicione um número inteiro à lista e, em seguida, remova o segundo elemento. Imprima o conteúdo final do array.

//var numerosInteiros: [Int] = [5 , 2 , 7 , 9 , 76 , 55 , 89 , 90 , 65 , 25]
//numerosInteiros.append(129)
//numerosInteiros.remove(at: 1)
//print(numerosInteiros)

//Exercício 4: Acesso a Valores
//Crie um dicionário com os nomes de três frutas e a quantidade que você possui de cada uma. Imprima quantas unidades de uma fruta de sua escolha você possui.
//var frutas: [String: Int] = ["Maça": 5,
//                            "Uva": 2,
//                            "Melancia": 4]
//let minhaFrutaEscolhida: Int = frutas ["Melancia"] ?? 0
//print(minhaFrutaEscolhida)


// MARK: - Estruturas de Repetição - 3 meios
// Estruturas de repetição são usadas para executar um bloco de código repetidamente até que uma condição específica seja atendida. Isso é útil para tarefas como processar coleções de dados ou repetir operações até que uma condição de parada seja alcançada.

// MARK: While (Enquanto)
// A estrutura de repetição 'while' executa um conjunto de instruções repetidamente, enquanto a condição fornecida é verdadeira. É ideal quando o número de iterações não é conhecido antes do loop iniciar.

// O While a primeira coisa que ele faz é verificar se a condição que está entre a palavra while e a chave é verdadeira. Se a condição for verdadeira ele entra no bloco de codigo e depois volta a repetir. Ele encerra a repetição apenas no momento em que a validação se torna falsa

//Exemplo 1:
//var idade: Int = 10
//while idade <= 12 {
//  print("A idade atual é de: \(idade)")
//  idade = idade + 1
//}
//print("final da execução")


// MARK: Repeat-While
// O 'repeat-while' é uma variação do loop 'while' que executa o bloco de código uma vez antes de verificar a condição no final do bloco.
// O repeat é igual o While, porem ele apriori executa e DEPOIS verifica se tem que repetir de novo

//var indexRepeat: Int = 110
//
//repeat {
//  print("Valor: \(indexRepeat)")
//  // += significa (indexRepeat = indexRepeat + 1)
//  // indexRepeat = indexRepeat + 1
//  indexRepeat += 1
//} while indexRepeat <= 110


//var indexRepeat: Int = 100
//
//repeat {
//  print("Valor: \(indexRepeat)")
//  // += significa (indexRepeat = indexRepeat + 1)
//  // indexRepeat = indexRepeat + 1
//  indexRepeat += 1
//} while indexRepeat <= 110


// MARK: For-In
// O loop 'for-in' itera sobre uma sequência, como um intervalo de números, e executa um conjunto de instruções para cada elemento na sequência.

//for value in 100...105 {
//  print("O valor atual é de: \(value)")
//}

// MARK: - Uso de For-In com Arrays/ Dicionario
// Arrays em Swift são coleções ordenadas de elementos. O loop 'for-in' permite iterar sobre cada elemento de um array de maneira simples e direta.

//var listaAnotacoes: [String] = ["Abastecer carro", "Colocar ração para o Ayron", "Pagar conta de energia", "Responder alunos"]
//
//for anotacao in listaAnotacoes {
//  print("Minha anotação é: \(anotacao)")
//}
//
//let listaAlunos: [String: Double] = ["Caio": 7.5, "Jorge": 4, "Matheus": 9, "Pedro": 2, "Manuela": 5, "Fred": 8,]
//var listaNomeAlunosAprovados: [String] = []
//
//for aluno in listaAlunos {
//  //   nota   for maior ou igual a 7
//  if aluno.value >= 7 {
//    listaNomeAlunosAprovados.append(aluno.key)
//  }
//}
//
//print(listaNomeAlunosAprovados)

// MARK: Usando Índices e Elementos no Array
// Usando a função 'enumerated()' para acessar tanto o índice quanto o valor de cada elemento do array.
// 'enumerated()' transforma o array em uma sequência de pares (índice, valor).


//for (index, anotacao) in listaAnotacoes.enumerated() {
//  print("A posição é: \(index) e a sua anotação é: \(anotacao)")
//}

//for (index, anotacao) in listaAnotacoes.enumerated() {
//  if anotacao == "Abastecer carro" {
//       listaAnotacoes.remove(at: index)
//       listaAnotacoes.append("Conferir pneus")

    // utilizamos o break no caso de existir apenas um unico item na lista. Com isso quando entrar na validação ele não precisa mais repetir para buscar outro valor
    // pois sabemos que ele não vai encontrar. Sendo assim, o break anula o loop
//       break
//  }
//}

//print(listaAnotacoes)

// Como reverter o array
//print(listaAnotacoes)  // ["Colocar ração para o Ayron", "Pagar conta de energia", "Responder alunos", "Conferir pneus"]
//listaAnotacoes.reverse()
//print(listaAnotacoes) //  ["Conferir pneus", "Responder alunos", "Pagar conta de energia", "Colocar ração para o Ayron"]


// MARK: - Exercicios ------------------------

// MARK: Exercício 1: Crie uma lista vazia e depois adicione 3 itens. Por fim, utilize o for para printar esses elementos

//var listaNomesExercicio: [String] = []
//
//listaNomesExercicio.append("Andrey")
//listaNomesExercicio.append("Akira")
//listaNomesExercicio.append("Rafael")
//
//for nomes in listaNomesExercicio {
//      print ("Nomes sao: \(nomes)")
//}


// MARK: Exercício 2: Crie um dicionario String:String com 3 itens. Imprima utilizando o for a chave de cada um deles.

var listaNomesCompletosExercicio: [String: String] = ["Maria": "Alves",
                                                      "Jose": "Lopes",
                                                      "Valquiria": "Zordan"]

for nomes in listaNomesCompletosExercicio {
//    print("A chave é: \(nomes.key)")
}


// MARK: Exercício 3: Adicionar chave e valor em um dicionário e imprimir ambos utilizando o for print("\(chave): \(valor)")

//var listaNomesCompletosExercicioB: [String: String] = ["Maria": "Alves",
//                                                      "Jose": "Lopes",
//                                                      "Valquiria": "Zordan"]
//
//listaNomesCompletosExercicioB.updateValue("Lima", forKey: "Pedro")
//
//for nome in listaNomesCompletosExercicioB{
//    print("\(nome.key) : \(nome.value)")
//}


// MARK: Exercício 4: Crie um array com 3 itens. Percorra o array utilizando o for, e realize o print de cada item. Realize o reverso do array que você criou.
// ["Caio", "Matheus", "Jorge"]
// ["Jorge", "Matheus", "Caio"]

//var listaItens: [String] = ["Carro", "Bicicleta", "Trem"]
//print(listaItens)
//listaItens.reverse()
//print(listaItens)


// MARK: Exercício 5: Crie um array de números inteiros. Utilizando o for, percorra o array e soma cada valor. Por fim, imprima o valor total de todos os números

//var listaExercicio5: [Int] = [10,25,48]
//var soma: Int = 0
//for value in listaExercicio5 {
//    soma = soma + value
//}
//print("Soma total: \(soma)")


var soma = 1
var count = 0
repeat {
    soma += 3
    count += 1
} while(count < 5)

print(soma)
