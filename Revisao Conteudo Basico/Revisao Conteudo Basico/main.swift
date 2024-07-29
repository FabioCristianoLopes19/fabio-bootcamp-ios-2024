//
//  main.swift
//  Revisao Conteudo Basico
//
//  Created by Fabio Cristiano Lopez on 13/06/24.
//

import Foundation

// Variaveis -> é uma referencia alocada na memória do comuputador
// Caracteristicas:
// Você precisa declara-la com 'var'
// A variavel pode variar o seu valor
// Uma variavel não pode ter o mesmo nome de outra já existente

var profissao: String = "programador"
profissao = "empresario"

// Constante
// Caracteristicas:
// Você precisa declara-la com 'let'
// A constante não pode variar o seu valor
// Uma constante não pode ter o mesmo nome de outra já existente

let idade: Int = 10

// Concatenação -> criando frases atraves de adição(soma)

let valorConcatenacao: Int = 10
let minhaIdadeFrase: String = "Minha idade é de: "
let anos: String = " anos"

//let fraseConcatenacao: String = minhaIdadeFrase + String(valorConcatenacao) + " " + anos
let fraseConcatenacao: String = minhaIdadeFrase + String(valorConcatenacao) + anos
//print(fraseConcatenacao)

// Interpolação -> é quando informamos para a nossa string qual vai ser o valor recebido naquela devida posição. Isso é demarcado pela barra invertida e abre e fecha parenteses \()
// Caracteristicas: Você não precisar tratar nenhuma tipagem real, pois qualquer conversão para String ele consegue tratar direto.

let valorInterpolacao: Int = 10
let fraseInterpolacao: String = "Minha idade é de: \(valorInterpolacao) anos"

// Opcionais -> Pode ou não existir valor
// Caracteristicas:
// Não necessita ser inicializada com valor
// Opcionais sempre são marcados com o simbolo de ?
// Necessita SEMPRE validar antes de utiliza-la, devido ao fato de ser nil!!!!!!!
// NIL NÃO É ZERO, NIL É NULOOOOOOO!!!!!!!!!
// JAMAIS utilizem o force unwrap(!)
// Sempre crie casos de contenção utilizando o (??)

var meuNomeOpcional: String? = nil
let meuNomeReal: String = meuNomeOpcional ?? ""
//print(meuNomeReal)

let idadeString: String = "222"
let idadeInt: Int = Int(idadeString) ?? 0
//print(idadeInt)


// Funcoes -> um bloco de codigo que tem a finalidade de conseguir ser reutilizavel quantas vezes quiser, como tambem abstrair a logica de situações complexas
// Caracteristicas:
// 4 tipos: Funcao sem parametro e sem retorno / Funcao com parametro e sem retorno / Funcao com parametro e com retorno / Funcao sem parametro e com retorno
// Toda funcao necessita de parentenses e abertura e fechamento de chaves
// SE CRIOU A FUNÇÃO, LEMBRE-SE DE CHAMA-LA!!!!!
// Se inicia com a palavra 'func'
// Pode ter retorno ou não
// Pode ter parametros ou não
// Pode ter muitos parametros
// Pode retornar qualquer tipagem
// Pode conter parametros de qualquer tipagem
// A parte principal de uma função é o NOME!!!! O NOME SEMPRE IRÁ DIZER OQUE ESSA FUNÇÃO VAI EXECUTAR!!!!!
// Toda função de retorno vai ter de forma explicita a seta -> e na frente a sua tipagem
// Parametro é aquilo que colocamos ENTRE o parentese (valor1: Int)
// Leu a palavra RETORNE/RETORNO significa que a função deve RETORNAR ALGO!!!

// função sem parametro, ela sempre vai ser executada da mesma forma!!!
//func calcularMedia() {
//  let nota1: Double = 10
//  let nota2: Double = 8
//  let nota3: Double = 7
//  let media: Double = (nota1 + nota2 + nota3) / 3
//  print("A media é \(media)")
//}

func calcularMedia(nota1: Double, nota2: Double, nota3: Double) {
  let media: Double = (nota1 + nota2 + nota3) / 3
  print("A media é \(media)")
}

//calcularMedia(nota1: 10, nota2: 8, nota3: 8)

//func exibirValoresAritimeticos(valor1: Int, valor2: Int) {
//   print("Soma: \(valor1 + valor2), Subtracao: \(valor1 - valor2), Multiplicação: \(valor1 * valor2), Divisão: \(valor1 / valor2)")
//}

func exibirValoresAritimeticos(valor1: Int, valor2: Int) {
  let soma: Int = valor1 + valor2
  let subtracao: Int = valor1 - valor2
  let multiplicacao: Int = valor1 * valor2
  let divisao: Int = valor1 / valor2
  print("Soma: \(soma), Subtracao: \(subtracao), Multiplicação: \(multiplicacao), Divisão: \(divisao)")
}

//exibirValoresAritimeticos(valor1: 20, valor2: 20)

func meusDadosCompleto(nome: String, idade: Int, peso: Double, altura: Double, cidade: String) -> String {
  return "Meu nome é \(nome) e tenho \(idade) anos, e moro em \(cidade) e atualmente estou medindo: \(altura) e pesando \(peso) kilos"
}

let minhasInformacoes: String = meusDadosCompleto(nome: "Caio", idade: 22, peso: 80, altura: 1.82, cidade: "Guaruja")
//print(minhasInformacoes)

func tenhoDesconto(valor: Double) -> Bool {
  if valor > 1000 {
    return true
  } else {
    return false
  }
}

let tenhoDescontoNoMercado: Bool = tenhoDesconto(valor: 100)
//print(tenhoDescontoNoMercado)


// Estruturas condicionais -> vamos trabalhar com condições
// if -> (Se) utilizado para VALIDAR SE A CONDIÇÃO É VERDADEIRA
// else -> (Se não) utilizado para tratar casos que não sejam verdadeiros
// else if -> utilizado para tratar OUTROS possiveis casos verdadeiros
// guard -> Muito semelhante ao if, porem ele em caso de falso, já retorna o metodo naquele instante
// if let -> É utilizado para garantir que a constante TENHA UM VALOR DENTRO DAQUELE BLOCO!!! (que não seja nil)
// guard let -> É utilizado para garantir que a constante TENHA UM VALOR DENTRO DAQUELE BLOCO!!! (que não seja nil)
// && -> E -> todas as condições devem ser verdadeiras
// || -> OU -> Se UMA DAS CONDIÇÕES forem verdadeiras ele já retorna verdadeiro, caso contrario false


var descontoOpcional: Bool? = nil

//if let desconto = descontoOpcional {
//  print(desconto)
//} else {
//  print("Não existe desconto")
//}

func alunoAprovado(nota1: Int, nota2: Int, nota3: Int, mediaMinima: Int) -> Bool {
  let media: Int = (nota1 + nota2 + nota3) / 3
  let aprovado: Bool = media >= mediaMinima
  return aprovado
}

func comprarCarro(valorGuardado: Double, temHabilitacao: Bool, nota1: Int, nota2: Int, nota3: Int, mediaMinima: Int) {
  let aprovado: Bool = alunoAprovado(nota1: nota1, nota2: nota2, nota3: nota3, mediaMinima: mediaMinima)

  if valorGuardado > 50000 && temHabilitacao && aprovado {
    print("pode comprar o carro")
  } else {
    print("NÃO pode comprar o carro")
  }
}

comprarCarro(valorGuardado: 60000, temHabilitacao: true, nota1: 5, nota2: 5, nota3: 5, mediaMinima: 7)


// 4- Crie uma função que receba dois parâmetros (eFimDeSemana: Bool, tenhoDinheiro: Bool) e caso
// seja final de semana e você tenha dinheiro, print "VAMOS PASSEAR", caso contrário, print "VAMOS FICAR EM CASA"

func avaliarPasseio(eFimDeSemana: Bool, tenhoDinheiro: Bool) {
    if eFimDeSemana && tenhoDinheiro {
        print("VAMOS PASSEAR")
    } else {
        print("VAMOS FICAR EM CASA")
    }
}
//avaliarPasseio(eFimDeSemana: true, tenhoDinheiro: true)

//5- Crie uma função que receba dois parâmetros do tipo Double e caso o valor do 1° parâmetro seja maior que o valor do 2° parâmetro. Retorne "Bola", caso contrário, retorne "Banana"

func compararValores(valor1: Double, valor2: Double) -> String {
    if valor1 > valor2 {
        return "Bola"
    } else {
        return "Banana"
    }
}
let valor: String = compararValores(valor1: 30, valor2: 20)
//print(valor)



//6- Crie uma função que receba um parâmetro (foiConvidado: Bool). Caso o valor seja true, print "Liberado para a festa" Caso contrário, print "Infelizmente você não foi convidado"

func verificarConvite (foiConvidado: Bool) {
    if foiConvidado == true {
        print("Liberado para a festa")
    } else {
        print("Infelizmente você não foi convidado")
    }
}
//verificarConvite(foiConvidado: true)

//7 - Implemente uma função que receba a idade de uma pessoa e determine se ela tem direito a entrada gratuita em um evento. Entrada gratuita é concedida para pessoas com menos de 5 anos ou mais de 65 anos.

func verificarEntradaGratuita(idade: Int) {
    if idade < 5 || idade > 65 {
        print("Entrada gratuita")
    } else {
        print("Entrada paga")
    }
}
//verificarEntradaGratuita(idade: 41)


//8 - Crie uma função que receba um score de crédito (tipo Int) de 0 a 1000 e retorne se a pessoa tem um "Bom crédito" (score acima de 700), "Crédito regular" (score entre 300 e 700) ou "Mau crédito" (abaixo de 300).

func avaliarScoreDeCredito(score: Int) -> String {
    if score > 700 {
        return "Bom crédito"
    } else if score >= 300 {
        return "Crédito regular"
    } else {
        return "Mau crédito"
    }
}
let statusCredito: String = avaliarScoreDeCredito(score: 900)
//print(statusCredito)

//9 - Implemente uma função que receba um dia da semana (tipo String) e retorne "Dia útil" se for de segunda a sexta, e "Final de semana" se for sábado ou domingo.

func classificarDiaSemana(dia: String) -> String {
    let lowercasedDay = dia.lowercased()
    if lowercasedDay == "sábado" || lowercasedDay == "domingo" {
        return "Final de semana"
    } else {
        return "Dia útil"
    }
}
let diaInformado: String = classificarDiaSemana(dia: "domingo")
//print(diaInformado)


//10 - Desenvolva uma função que receba uma senha (tipo String) e retorne "Senha fraca" se tiver menos de 6 caracteres, "Senha média" se tiver entre 6 e 8 caracteres, e "Senha forte" se tiver mais de 8 caracteres.
// Dica: Para descobrir a quantidade de caracteres de uma string, basta utilizar a propriedade .count
// Obs.: print(nome.count) -> vai printar a quantidade de caracteres

func avaliarForcaSenha(senha: String) -> String {
    let tamanho = senha.count
    if tamanho < 6 {
        return "Senha fraca"
    } else if tamanho <= 8 {
        return "Senha média"
    } else {
        return "Senha forte"
    }
}
let senhaInformada: String = avaliarForcaSenha(senha: "trefd")
//print(senhaInformada)


//11 - Crie uma função que receba a altura de uma pessoa em metros (tipo Double) e retorne "Baixa" se for menor que 1.60 metros, "Média" se for entre 1.60 e 1.85 metros, e "Alta" se for maior que 1.85 metros.

func classificarAltura(altura: Double) -> String {
    if altura < 1.60 {
        return "Baixa"
    } else if altura <= 1.85 {
        return "Média"
    } else {
        return "Alta"
    }
}
let alturaInformada: String = classificarAltura(altura: 1.73)
//print(alturaInformada)

//12 - Crie uma função que receba a idade de uma pessoa (tipo Int) e o tempo de serviço em anos (tipo Int). Uma pessoa é elegível para promoção se tiver mais de 30 anos e mais de 5 anos de serviço. A função deve retornar "Promoção Elegível" se ambas as condições forem verdadeiras, e "Promoção Não Elegível" caso contrário.

func avaliarElegibilidadePromocao(idade: Int, tempoServico: Int) -> String {
    if idade > 30 && tempoServico > 5 {
        return "Promoção Elegível"
    } else {
        return "Promoção Não Elegível"
    }
}
let resultadoPromocao: String = avaliarElegibilidadePromocao(idade: 41, tempoServico: 5)
//print (resultadoPromocao)


//13 - Implemente uma função que receba a previsão de chuva (tipo Bool) e a temperatura (tipo Double). O evento ao ar livre deve ser cancelado se chover (true) ou se a temperatura for inferior a 15 graus. A função deve retornar "Evento Cancelado" se alguma das condições for verdadeira, e "Evento Confirmado" caso contrário.

func avaliarEvento(previsaoChuva: Bool, temperatura: Double) -> String {
    if previsaoChuva || temperatura < 15 {
        return "Evento Cancelado"
    } else {
        return "Evento Confirmado"
    }
}
let climaDia: String = avaliarEvento(previsaoChuva: false, temperatura: 29.8)
//print(climaDia)

//14 - Desenvolva uma função que receba uma senha (tipo String) e a hora do dia (tipo Int, representando a hora). O acesso é permitido se a senha for "1234" e for entre as 9h e as 17h. A função deve retornar "Acesso Permitido" se ambas as condições forem verdadeiras, e "Acesso Negado" se qualquer uma das condições não for atendida.

func verificarAcesso(senha: String, hora: Int) -> String {
    if senha == "1234" && (hora >= 9 && hora <= 17) {
        return "Acesso Permitido"
    } else {
        return "Acesso Negado"
    }
}
let statusAcesso: String = verificarAcesso(senha: "1234", hora: 17)
//print(statusAcesso)


