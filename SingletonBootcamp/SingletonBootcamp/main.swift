//
//  main.swift
//  SingletonBootcamp
//
//  Created by Fabio Cristiano Lopes on 21/08/24.
//

import Foundation

//MARK: - O que é um Design Pattern (Padrão de Projeto)

// Um Design Pattern (Padrão de Projeto) é uma solução reutilizável para um problema comum que surge durante o desenvolvimento de software. Eles são como receitas que ajudam os desenvolvedores a resolver problemas recorrentes de maneira eficiente e organizada. Padrões de projeto não são código pronto, mas sim modelos ou guias que você pode adaptar ao seu código para resolver problemas específicos de design

// Existem vários tipos de padrões de projeto, e eles são geralmente classificados em três categorias principais:

// Padrões Criacionais: Tratam da criação de objetos, abstraindo o processo de instanciação.
// Exemplo: Singleton, Factory, Abstract Factory.
// Padrões Estruturais: Tratam da composição de classes ou objetos para formar estruturas maiores.
// Exemplo: Adapter, Composite, Facade.
// Padrões Comportamentais: Tratam da interação e comunicação entre objetos.
// Exemplo: Observer, Strategy, Command.


// MARK: - O que é um Singleton?

// O Singleton é um padrão de design que garante que uma classe tenha apenas uma instância ao longo da aplicação e fornece um ponto global de acesso a essa instância. Em outras palavras, ele assegura que você tenha uma única instância de uma classe que possa ser compartilhada e usada em diferentes partes do código.

// MARK: - Pontos de atenção

// Recomenda-se criar singletons com class ao inves de struct pelos motivos apresentados abaixo
// Verificar se é necessário colocar o construtor com private init ou não.
// Se caso seu singleton não precisar ser reutilizado com principio de herança, deixa-lo como final

final class Logger {
  // A instância estática é única da classe
  static let shared = Logger()

  // O inicializador é privado para impedir que outros partes do código criem instâncias da classe
  private init() { }

  func log(message: String) {
    print("➡️ Log: \(message) ⬅️")
  }
}

// MARK: - Como usar o Singleton
// Agora, para você usar o Logger, você não precisa criar uma nova instância da classe. Em vez disso, você usa a instância compartilhada(shared):
Logger.shared.log(message: "Meu primeiro Singleton ;)")
// Outra chamada para o Singleton
Logger.shared.log(message: "Meu segundo Singleton ;)")


// MARK: - Vantagens do Singleton
// Estado compartilhado: Fácil compartilhamento de dados entre diferentes partes do código.
// Controle centralizado: Centraliza a gestão de recursos como conexão de banco de dados ou logging.
// Facilidade de uso: Uma vez configurado, o Singleton é fácil de acessar.

// MARK: - Cuidados com o Singleton

// Gerenciamento de estado global: Pode ser um problema se não for bem gerido, pois pode introduzir estados imprevisíveis na aplicação.
// Dificuldade em testar: Pode ser difícil escrever testes unitários, pois a instância é compartilhada e pode manter estados inesperados entre os testes.
// Risco de violar o princípio da responsabilidade única (SRP): Se você começar a adicionar mais funcionalidades ao Singleton, ele pode se tornar um monstro bem difícil de manter.

// Passo 1 - criar classe
final class User {

  // Passo 2 - criar instancia compartilhada
  static let shared = User()

  // Passo 3 - privar init
  private init() { }

  var nome: String?
}

class Login {
  func fetchUser() {
    User.shared.nome = "Caio"
  }
}

let login = Login()
login.fetchUser()

class DetalheDoProduto {
  var nomeUsuario = User.shared.nome ?? ""
}

User.shared.nome = nil
var microondas = DetalheDoProduto()
print(microondas.nomeUsuario)


// MARK: - Class ou Struct em Singleton?

final class ClassSingleton {
  static let shared = ClassSingleton() // Instancia única e compartilhada

  private init() { } // Impede a criação de novas instâncias

  var state: Int = 10
}

func testClassSingleton() {
  print("Valor da Classe antes da atualização é: \(ClassSingleton.shared.state)")

  ClassSingleton.shared.state = 50
  let newObj = ClassSingleton.shared
  newObj.state = 20

  print("Valor da Classe após a atualização é: \(ClassSingleton.shared.state)")
  print("Valor do novo Objeto que estamos usando na classe é: \(newObj.state)")
}

testClassSingleton()

// -------------------------------------------------------------------------------

struct StructSingleton {
  static var shared = StructSingleton() // Instancia única e compartilhada

  private init() { } // Impede a criação de novas instâncias

  var state: Int = 10
}

func testStructSingleton() {
  print("Valor da Struct antes da atualização é: \(StructSingleton.shared.state)")


  StructSingleton.shared.state = 50
  var newObj = StructSingleton.shared
  newObj.state = 20

  print("Valor da Struct após a atualização é: \(StructSingleton.shared.state)")
  print("Valor do novo Objeto que estamos usando na struct é: \(newObj.state)")
}

testStructSingleton()

// Classe Singleton: A mudança no state é refletida em toda a aplicação porque a instância shared é compartilhada por REFERÊNCIA

// Struct Singleton: A mudança no state não afeta a instância shared original, porque struct trabalha com VALUE TYPE, sendo assim, criando uma nova instância TODA A VEZ que cria uma nova fonte de armazenamento (Ex: var newObj = StructSingleton.shared). A alteração acontece apenas na cópia (newObj)


// MARK: - Diferença entre let/var shared em Class e em Struct

// CLASS LET

final class MusicPlayerClassLet {
  static let shared = MusicPlayerClassLet()

  private init() { }

  var volume: Int = 50
}

func testClassSingletonLet() {
  print("Volume da Classe antes da atualização (let): \(MusicPlayerClassLet.shared.volume)")

  MusicPlayerClassLet.shared.volume = 75

  print("Volume da Classe após a atualização (let) \(MusicPlayerClassLet.shared.volume)")
}

testClassSingletonLet()

//Volume da Classe antes da atualização (let): 50
//Volume da Classe após a atualização (let) 75

// CLASS VAR
final class MusicPlayerClassVar {
  static var shared = MusicPlayerClassVar()

//  private init() { }

  var volume: Int = 50
}

func testClassSingletonVar() {
  print("Volume da Classe antes da atualização (var): \(MusicPlayerClassVar.shared.volume)")

  MusicPlayerClassVar.shared.volume = 75
  print("Volume da Classe após a atualização (var) \(MusicPlayerClassVar.shared.volume)")

  MusicPlayerClassVar.shared = MusicPlayerClassVar()
  print("Volume da Classe após trocar o shared (var) \(MusicPlayerClassVar.shared.volume)")

}

testClassSingletonVar()

// ------------------------------------------------------------------------------------------

// STRUCT VAR

struct MusicPlayerStructLet {
  static var shared = MusicPlayerStructLet()

  private init() { }

  var volume: Int = 50
}

func testStructSingletonLet() {
  print("Volume da Struct antes da atualização (let): \(MusicPlayerStructLet.shared.volume)")

  MusicPlayerStructLet.shared.volume = 75

  print("Volume da Struct após a atualização (let) \(MusicPlayerStructLet.shared.volume)")
}

testStructSingletonLet()

// Class com 'let shared': Mesmo sendo 'let', o objeto 'shared' ainda pode ter suas propriedades alteradas porque class é um tipo referencia. Isso significa que você não pode mudar a instancia do shared, mas pode alterar as propriedades internas.

// Class com 'var shared': Permite que você substitua a instancia inteira do shared criando uma nova instancia! (é como se realizasse um reset e voltasse com os valores default). Isso pode ser bom e ao mesmo tempo perigoso, pois perde TODO o estado/informações anterior.

// Struct com 'let shared': Como 'struct' é um tipo Value Type, quando o 'shared' é 'let', você não pode alterar suas propriedades. Ele é completamente imutável.

// Struct com 'var shared': Permite alterar as propriedades de shared, mas qualquer alteração cria uma nova COPIA DA STRUCT!!! Isso significa que a mutabilidade ainda está restrita, mas você pode alterar o estado do singleton.

// Resumo
// Classe com let: A instância é fixa, mas suas propriedades podem ser alteradas.
// Classe com var: Permite substituir a instância, o que pode ser arriscado.
// Struct com let: A instância e suas propriedades são imutáveis.
// Struct com var: As propriedades podem ser alteradas, mas toda alteração cria uma nova cópia.
