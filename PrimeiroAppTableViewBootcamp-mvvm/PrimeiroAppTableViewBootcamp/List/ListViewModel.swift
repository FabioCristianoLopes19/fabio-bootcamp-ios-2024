//
//  ListViewModel.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Fabio Cristiano Lopes on 07/08/24.
//

import Foundation

// Temos 2 formas de trabalhar com objeto
// A primeira que é mais simples é utilizando o private(set), que com ele o seu objeto pode ser acessado pela viewController para VISUALIZAÇÃO(GET), porem para ALTERAR(SET) só é possível dentro da classe da ViewModel
//

class ListViewModel {

  private var listPerson: [Person] = [Person(name: "Caio", lastName: "Fabrini", age: 22, image: "person.circle"),
                              Person(name: "Bárbara", lastName: "Fabrini", age: 21, image: "star.fill"),
                              Person(name: "Bárbara", lastName: "Brigolin", age: 21, image: "star.fill"),
                              Person(name: "Thiago", lastName: "Teves", age: 30, image: "person.circle"),
                              Person(name: "Matheus", lastName: "Humbro", age: 28, image: "medal.star"),
                              Person(name: "Lucas", lastName: "Costa", age: 26, image: "folder.circle"),
                              Person(name: "Alice", lastName: "Pereira", age: 20, image: "staroflife.fill")]

  // Você pode utilizar tanto a função de retorno, como tambem a variavel computada. Se caso você tiver um griso como o professor, você sempre utilize a variavel computada QUANDO NÃO PRECISAR DE PARAMETRO, caso precise, utilize a função de retorno.

  // função get de retorno
  func getListPerson() -> [Person] {
    return listPerson
  }

  // variável computada de retorno
  var getComputedListPerson: [Person] {
    return listPerson
  }

  var numberOfRowsInSection: Int {
    return listPerson.count
  }

  func loadCurrentPerson(indexPath: IndexPath) -> Person {
    return listPerson[indexPath.row]
  }

  func deletePerson(person: Person) {
    // Opção 1
    //    for (index, value) in listPerson.enumerated() {
    //      if value == person {
    //        listPerson.remove(at: index)
    //        screen?.tableView.reloadData()
    //      }
    //    }

    // Opção 2 -> remove todos que são iguais
    //    listPerson.removeAll { $0 == person }
    //    screen?.tableView.reloadData()

    // Opção 3 -> pega o primeiro da lista, SE CASO EXISTIR!!
    //    if let index = listPerson.firstIndex(of: person) {
    //      listPerson.remove(at: index)
    //      screen?.tableView.reloadData()
    //    }
    listPerson.removeAll { $0 == person }
  }

  
}
