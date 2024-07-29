//
//  main.swift
//  Conceitos Basicos Completo
//
//  Created by Fabio Cristiano Lopez on 06/06/24.
//

import Foundation

// Oque é uma variavel?

// Uma variável é um espaço reservado na memória do computador onde você pode armazenar e modificar valores durante a execução de um programa

// Imagine que você tem uma caixa onde pode guardar coisas. Cada vez que você quiser guardar algo diferente, você pode substituir o que está dentro por um novo item. No mundo da programação, essa caixa é chamada de "variável".

// Por exemplo, se você está criando um aplicativo e precisa guardar a idade de um usuário, você pode criar uma variável chamada idade e armazenar o número correspondente nela. A qualquer momento que você precisar dessa informação, você pode "olhar dentro da caixa" para ver o que está guardado lá.


// Como criar uma variavel:
// 1 passo: você escreve a palavra var
// 2 passo: defina um nome para essa variavel (ESSA É A PARTE MAIS IMPORTANTE DO SEU CODIGO)
// 3 passo: atribua a sua tipagem
// 4 passo: atribua um valor a variavel

// Exemplo:
// var meuNome: String = "Meu nome é Caio"

// Dicas:

// Uma variavel/constante NÃO PODE TER O MESMO NOME!! ELES NÃO PODEM REPETIR
// Utilizamos o padrão de nomenclatura "camelCase". Nele, a primeira letra da variável ou função é minúscula e as primeiras letras das palavras subsequentes são maiúsculas, sem espaços entre elas. Por exemplo: minhaVariavel, valorTotal, calcularIdadeUsuario. Jamais utilize caracteres especiais ou acentuação

//Exemplo aula:
var comidaPreferida = "Churrasco"
//print(comidaPreferida)
//
var sobrenome = "Fabrini"
//print(sobrenome)
//
//Build segue a sequencia conforme o exemplo abaixo (vai prevalecer o ultimo valor informado):

comidaPreferida = "Japones"
comidaPreferida = "Abobora"
//print(comidaPreferida)
//print(comidaPreferida)

// Tipagem - TODAS SE INICIAM COM A PRIMEIRA LETRA MAIUSCULA


// Explicita / Implicita

// implicita
// É quando criamos uma variavel e não deixamos em evidencia sua respectiva TIPAGEM

// explicita
// É quando criamos uma variavel e deixamos em evidencia sua respectiva TIPAGEM

var tamanhoCalcado: Int = 10
var meuNovoTeste = "banana"


// É algo que definimos para que as nossas contantes/variaveis tenham de valor

// String
// São variaveis/constantes que apresentam seu valor como forma de TEXTO
// Para criar uma variavel do tipo STRING seu valor deve conter aspas duplas ""

var nome = "Caio"
var tipoChocolate = "Amargo"

// Int
// São variaveis/constantes que apresentam seu valor como números INTEIROS
// Para criar uma variavel do tipo INT seu valor deve conter apenas números inteiros

var idade = 21
var potencia = 500

// Bool - Booleano
// São variaveis/constantes que apresentam seu valor como verdadeiro(true) ou falso(false)

var desconto: Bool = false
var estaNaPromocao: Bool = true

// Float / Double
// São variaveis/constantes que apresentam seu valor como números reais
// Para criar uma variavel do tipo Float/Double seu valor deve conter apenas números reais
// OBS: Sempre utilizem o Double!!!!!
// OBS: Float as casas decimais são limitas. Double as casas decimais são ilimitadas.

var numeroFloat: Float =   150.43248922342343
var numeroDouble: Double = 150.43248922342343
//print(numeroFloat)
//print(numeroDouble)

// Operadores Aritmeticos

// Adição

var numeroAdicaoUm: Int = 500
var numeroAdicaoDois: Int = 200
var resultadoAdicao: Int = numeroAdicaoUm + numeroAdicaoDois
//print(resultadoAdicao)

// Subtração

var numeroSubtracaoUm: Int = 300
var numeroSubtracaoDois: Int = 200
var resultadoSubtracao: Int = numeroSubtracaoUm - numeroSubtracaoDois
//print(resultadoSubtracao)

// Multiplicação

var numeroMultiplicacaoUm: Int = 10
var numeroMultiplicacaoDois: Int = 20
var resultadoMultiplicacao: Int = numeroMultiplicacaoUm * numeroMultiplicacaoDois
//print(resultadoMultiplicacao)

// Divisão

var numeroDivisaoUm: Int = 10
var numeroDivisaoDois: Int = 10
var resultadoDivisao: Int = numeroDivisaoUm / numeroDivisaoDois
//print(resultadoDivisao)


// Concatenação
// É quando juntamos valores com base em uma ADIÇÃO

var frase1: String = "Olá, qual a sua idade: "
var frase2: Int = 21
var frase3: String = " anos"

var resultadoConcatenacao: String = frase1 + String(frase2) + frase3

//print(resultadoConcatenacao)

// Interpolação
// Com a interpolação já converte o tipo já de forma direta para STRING
// Para utiliza-la é muito simples, basta colocar no local de sua preferencia a \() e dentro do parentes o seu valor para apresentar na string

//OBS: frase2 (tipagem Int - com a interpolação já converte o tipo para String) utilizada neste exercício é o mesmo do exercício anterior
var resultadoInterpolacao: String = "Olá, qual a sua idade: \(frase2) anos"
//print(resultadoInterpolacao)


// Converter Tipagens

// Converter Int, Double, Float para String!!!
// Quando queremos converter um tipo Int, Double, Float para String, você precisa apenas informar o valor dentro dos parenteses:
// Segue exemplo abaixo:

var umValorIntParaString: Int = 100
var textoInt: String = String(umValorIntParaString)
//print(textoInt)

//Meu treinamento abaixo
var valorIntParaString: Int = 10
var textoStringQueEraInt: String = String(valorIntParaString)
//print(textoStringQueEraInt)

// String -> para INT

// Todas as vezes que for converter uma string para qualquer tipagem ela SEMPRE será opcional

var minhaIdadeString: String = "22"
var minhaIdadeInt: Int = Int(minhaIdadeString) ?? 0
//print(minhaIdadeInt)



// Opcionais
// As variaveis opcionais são MUITO utilizadas no nosso dia a dia. Essas variaveis sempre terão 2 estados, um com valor REAL(existente) ou como nil (valor nulo)
// OBS: NIL NÃO É ZERO -> NIL É NULO!!!!!!!!!!!!!


var minhaIdade: Int? = 20
//print(minhaIdade ?? 0)
minhaIdade = nil
//print(minhaIdade)

var nomeMae: String? = nil
//print(nomeMae ?? "")


var idadeString: String = "22"
var idadeInt: Int = Int(idadeString) ?? 0
//print(idadeInt)


var minhaIdadeOption: Int? = 20
var minhaIdadeStringNew: String = String(minhaIdadeOption ?? 0)
//print(minhaIdadeStringNew)


//  Constante -> let
//  Quando utilizar cada caso?
//  SEMPRE crie uma CONSTANTE!!!!!!!
// Caso precise alterar, fique tranquilo, o compilador vai te avisar, e é só você pressionar um fix ;)

let meuNomeHoje: String = "Caio"
//print(meuNomeHoje)



// MARK: - Exercicios



// MARK: Exercício 1: Formatação de Strings
// Declare uma variável produto do tipo String e atribua a ela o valor "Notebook". Declare outra variável preco do tipo Double e atribua a ela o valor 3999.99. Formate e imprima uma frase que diga "O produto Notebook custa R$ 3999.99".
 
 
var produto: String = "Notebook"
var preco: Double = 3999.99
//print("O produto \(produto) custa R$ \(preco)")

//OU

var produtoNovoExemplo: String = "Notebook"
var precoNovoExemplo: Double = 3999.99
var fraseCompleta: String = "O produto \(produtoNovoExemplo) custa R$ \(precoNovoExemplo)"
//print(fraseCompleta)

//treinamento
var produto1: String = "Notebook"
var valor1: Double = 3999.99

var fraseCompleta1: String = "O produto \(produto1) custa R$ \(valor1)"

//print(fraseCompleta1)

 
 
// MARK: Exercício 2: Média de Três Números
// Declare três variáveis com números inteiros. Calcule e imprima a média desses números.
// print("Média dos três números: \(variavel)")
 
 
var number1: Int = 10
var number2: Int = 9
var number3: Int = 4
var media = (number1 + number2 + number3) / 3
//print("Média dos três números: \(media)")

//ou

var number1Novo: Int = 10
var number2Novo: Int = 9
var number3Novo: Int = 4
var resultadoSomaTotalNovoExemplo = number1Novo + number2Novo + number3Novo
var mediaNovoExemplo = resultadoSomaTotalNovoExemplo / 3
//print("Média dos três números: \(mediaNovoExemplo)")





// MARK: Exercício 3: Concatenação de Strings
// Declare duas variáveis de tipo String para o nome e sobrenome de uma pessoa. Concatene as duas strings em uma terceira variável e imprima o nome completo no console.
// print("Nome completo: \(variavel)")

var meuNomeConcatenacao: String = "Fabio"
var meuSobrenomeConcatenacao: String = "Lopes"
var nomeCompletoConcatenacao: String = meuNomeConcatenacao + " " + meuSobrenomeConcatenacao
//print("Nome completo: \(nomeCompletoConcatenacao)")

//Treinamento

var nomeUm: String = "Louise"
var sobrenomeUm: String = "Lopes"
var nomeCompletoum: String = "Nome completo: \(nomeUm) \(sobrenomeUm)"

//print (nomeCompletoum)

// MARK: Exercício 4: Conversão de Tipagem
// Declare uma variável idadeString com o valor "25". Converta essa string para um valor do tipo Int. Em seguida, declare uma variável alturaString com o valor "1.75" e converta-a para um valor do tipo Double. Imprima ambos os valores convertidos.
// print("Idade: \(variavel)")
// print("Altura: \(variavel)")

var IdadeStringExercicio: String = "25"
var IdadeIntExercicio: Int = Int(IdadeStringExercicio) ?? 0
//print("Idade: \(IdadeIntExercicio)")

var alturaStringExercicio: String = "1.75"
var alturaDoubleExercicio: Double = Double(alturaStringExercicio) ?? 0.0
//print("Altura: \(alturaDoubleExercicio)")

// MARK: Exercício 5: Operações Aritméticas
// Declare duas variáveis do tipo Float, numeroA e numeroB, com valores de sua escolha. Calcule e imprima a soma, subtração, multiplicação e divisão desses valores.
//print("Soma: \(variavel)")
//print("Subtração: \(variavel)")
//print("Multiplicação: \(variavel)")
//print("Divisão: \(variavel)")

var numeroA: Float = 25
var numeroB: Float = 10

var somaExercicio: Float = numeroA + numeroB
//print("Soma: \(somaExercicio)")

var subtracaoExercicio: Float = numeroA - numeroB
//print("Subtração: \(subtracaoExercicio)")

var multiplicacaoExercicio: Float = numeroA * numeroB
//print("Multiplicação: \(multiplicacaoExercicio)")

var divisaoExercicio: Float = numeroA / numeroB
//print("Divisão: \(divisaoExercicio)")





// MARK: Exercício 6: Conversão de Tipagem de Float para Int
// Declare uma variável pesoFloat do tipo Float e atribua a ela o valor 70.5. Converta essa variável para o tipo Int e imprima o valor convertido.
//print("Peso como Int: \(variavel)")

var pesoFloat: Float = 70.5
var pesoInt: Int = Int(pesoFloat)
//print("Peso como Int: \(pesoInt)")




// MARK: Exercício 7: Divisão de Conta
// Declare uma variável totalConta do tipo Double com o valor da conta de um restaurante. Declare uma variável numeroDePessoas do tipo Int com o número de pessoas que dividirão a conta. Calcule e imprima quanto cada pessoa deve pagar.
//print("Cada pessoa deve pagar: R$ \(variavel)")

var totalConta: Double = 430.80
var numeroDePessoas: Int = 6
var valorPorPessoa: Double = totalConta / Double(numeroDePessoas)
//print("Cada pessoa deve pagar: R$ \(valorPorPessoa)")



// MARK: Exercício 8: Calculadora de IMC
// Declare variáveis peso e altura do tipo Double. Calcule e imprima o Índice de Massa Corporal (IMC) usando a fórmula: IMC = peso / (altura * altura).
//print("O IMC é: \(variavel)")

var peso: Double = 89.6
var altura: Double = 1.73
var imc = peso / (altura * altura)
//print("O IMC é: \(imc)")



// MARK: Exercício 9: Segundos em um Ano
// Calcule e imprima o número de segundos em um ano (considere um ano com 365 dias).
//print("Número de segundos em um ano: \(variavel)")

var segundosPorMinuto = 60
var minutosPorHora = 60
var horasPorDia = 24
var diasPorAno = 365
var segundosPorAno = segundosPorMinuto * minutosPorHora * horasPorDia * diasPorAno
//print("Número de segundos em um ano: \(segundosPorAno)")



// MARK: Exercício 10: Comparação de Números
// Declare duas variáveis primeiroNumero e segundoNumero do tipo Int. Verifique se numero1 é maior que numero2 e imprima o resultado.
// print("O primeiro número é maior que o segundo: \(variavel)")


var primeiroNumero: Int = 26
var segundoNumero: Int = 10
var primeiroMaiorQueSegundo: Bool = primeiroNumero > segundoNumero
//print("O primeiro número é maior que o segundo: \(primeiroMaiorQueSegundo)")

//
//  main.swift
//  Desafios Conceitos Basicos Licao de casa
//
//  Created by Caio Fabrini on 08/06/24.
//

import Foundation

// MARK: Exercício 1: Cálculo de Desconto
// Declare variáveis precoOriginal e percentualDesconto do tipo Double. Calcule o valor do desconto e o preço final após aplicar o desconto. Imprima ambos.

let precoOriginal: Double = 980.0
let percentualDesconto: Double = 10.0

let valorDesconto = precoOriginal * (percentualDesconto / 100)
let precoFinal = precoOriginal - valorDesconto

//print("Valor do desconto: R$ \(valorDesconto)")
//print("Preço final após desconto: R$ \(precoFinal)")

// MARK: Exercício 2: String Interpolada
// Declare variáveis cidade e estado do tipo String e populacao do tipo Int. Crie uma string interpolada que imprima uma frase informando a cidade, o estado e a população.

let cidade: String = "Osasco"
let estado: String = "SP"
let populacao: Int = 777048
let descricao = "A cidade de \(cidade), \(estado), tem uma população de \(populacao) habitantes."
//print(descricao)

//ou

let cidade1: String = "Osasco"
let estado1: String = "SP"
let populacao1: Int = 777048
//print("A cidade de \(cidade1), \(estado1), tem uma população de \(populacao1)")

// MARK: Exercício 3: Concatenando e Calculando
// Declare variáveis quantidade do tipo Int e precoUnitario do tipo Double. Calcule o valor total multiplicando a quantidade pelo preço unitário e imprima uma mensagem formatada com o resultado.

let quantidade: Int = 8
let precoUnitario: Double = 26.75
let valorTotal:Double = Double(quantidade) * precoUnitario
let mensagem = "O valor total para \(quantidade) itens é: R$ \(valorTotal)"
//print(mensagem)

//ou

let quantidade1: Int = 8
let precoUnitario1: Double = 26.75
let valorTotal1:Double = Double(quantidade1) * precoUnitario1
//print("O valor total para \(quantidade1) itens é: R$ \(valorTotal1)")

// Exercício 4: Convertendo Celsius para Fahrenheit
// Declare uma variável celsius do tipo Double. Converta essa temperatura para Fahrenheit usando a fórmula F = C * 9/5 + 32 e imprima o resultado.

let celsius: Double = 29.0
let fahrenheit = celsius * 9 / 5 + 32
//print("Temperatura em Fahrenheit: \(fahrenheit)")

// Exercício 5: Conversão de Idade para Dias
// Declare uma variável idade do tipo Int. Calcule e imprima a idade em dias (considerando 365 dias por ano).

let idadeFabio: Int = 40
let idadeEmDias = idadeFabio * 365
//print("Idade em dias: \(idadeEmDias)")


//Exercício 6: Calculando Salário Anual
// Declare uma variável salarioMensal do tipo Double. Calcule e imprima o salário anual.

let salarioMensal: Double = 5000.0
let salarioAnual = salarioMensal * 12
//print("Salário anual: \(salarioAnual)")

//Exercício 7: Multiplicação de Float por Int
// Declare uma variável valorFloat do tipo Float e uma variável multiplicador do tipo Int. Calcule e imprima o resultado da multiplicação.

let valorFloat: Float = 50.10
let multiplicador: Int = 5
let resultado: Float = valorFloat * Float(multiplicador)
//print("Resultado da multiplicação: \(resultado)")

//Exercício 8: Concatenando String e Número
// Declare uma variável texto do tipo String e uma variável numero do tipo Int. Concatene-os e imprima o resultado.

let texto: String = "O número da minha casa é "
let numero: Int = 17
let resultadoTexto = texto + String(numero)
//print(resultadoTexto)


//Exercício 9: Calculando Desconto
// Declare variáveis precoOriginal e percentualDesconto do tipo Double. Calcule o valor final após aplicar o desconto e imprima o resultado.

let precoOriginalSemDesconto: Double = 500.0
let percentualDescontoProduto: Double = 30.0
let valorDescontoTotal = precoOriginalSemDesconto * (percentualDescontoProduto / 100)
let precoFinalComDesconto = precoOriginalSemDesconto - valorDescontoTotal
//print("Preço final com desconto: \(precoFinalComDesconto)")


//Exercício 10: Conversão de Boolean para String
// Declare uma variável estaChovendo do tipo Bool e atribua a ela um valor. Converta essa variável para String e imprima o resultado.

let estaChovendo: Bool = true
let estaChovendoString: String = String(estaChovendo)
//print("Está chovendo: \(estaChovendoString)")

//outra forma de fazer o exercicio

let estaChovendoNovaForma: Bool = true
//print("Está chovendo: \(estaChovendoNovaForma)")

//ou

let estaChovendo1: Bool = true
//print(estaChovendo1)


//Exercício 11: Calculando Diferença de Idades
// Declare duas variáveis idadePessoa1 e idadePessoa2 do tipo Int. Calcule e imprima a diferença entre as idades.

let idadePessoa1: Int = 43
let idadePessoa2: Int = 41
let diferencaIdades = idadePessoa1 - idadePessoa2
//print("Diferença de idades: \(diferencaIdades) anos")

//Exercício 12: Concatenando Números em uma String
// Declare três variáveis dia, mes e ano do tipo Int. Concatene esses valores em uma string no formato "dd/mm/yyyy" e imprima o resultado.

let dia: Int = 19
let mes: Int = 7
let ano: Int = 1983
let dataFormatada = String(dia) + "/" + String(mes) + "/" + String(ano)
//print("Data formatada: \(dataFormatada)")

// MARK: - RESPOSTAS!!! LEMBRESE-SE, PROGRAMAR NÃO É DECORAR, E SIM ENTENDER E SABER OQUE VOCÊ ESCREVE E O PORQUE FUNCIONA E O PORQUE NÃO FUNCIONA!








// Atalhos de teclado:
// Duplicar Linha de codigo: CMD + D
// Selecionar mais de um local ao mesmo tempo: Control + Shift
// Rodar o buid: CMR + R
// Como comentar rapido uma linha: CMD + /
// Como comentar rapido varias linha: Selecione tudo oque você quer comentar e pressione -> CMD + /

// MARK: TREINAMENTO

var idadeLouise: Int = 7
//print("A idade da Louise é \(idadeLouise)")

// treinando var / let
let nomeFilho: String = "Henry"
//nomeFilho = Louise como o nomeFilho esta como let não pode ser alterado
var idadeFilho: Int = 14
idadeFilho = 15
//print ("Meu filho \(nomeFilho) tem \(idadeFilho) anos")

var minhaidadeFabio: Int = 40
var minhaidadeFabioString: String = minhaIdadeStringNew
//print (minhaidadeFabioString)
//print ("Minha idade é \(minhaidadeFabio)")
//print ("Tenho \(minhaidadeFabioString) anos")

var idadeLouiseTexto: String = "25"
var idadeLouiseNumero: Int = Int (idadeLouiseTexto) ?? 10
//print (idadeLouiseNumero)

var idadeLouiseTexto2: String = ""
var idadeLouiseNumero2: Int = Int (idadeLouiseTexto2) ?? 10
//print (idadeLouiseNumero2)

var idadeHenryTexto: String? = nil
//print (idadeHenryTexto)


var idadeJose: Int? = 20
//print(idadeJose ?? 0)
//print(idadeJose ?? 10)
idadeJose = nil
//print(idadeJose)

var nomeCliente: String? = nil
//print(nomeCliente ?? "")

var qtdePneusCarroTexto: String = "4"
var qtdePneusCarroNumero: Int = Int (qtdePneusCarroTexto) ?? 0
//print (qtdePneusCarroNumero)
