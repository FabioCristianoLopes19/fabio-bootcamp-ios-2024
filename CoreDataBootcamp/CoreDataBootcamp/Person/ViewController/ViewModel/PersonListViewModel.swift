//
//  PersonListViewModel.swift
//  CoreDataBootcamp
//
//  Created by Fabio Cristiano Lopes on 30/09/24.
//

import CoreData

protocol PersonListViewModelProtocol: AnyObject {
  func updateTableView()
}

class PersonListViewModel {

  private weak var delegate: PersonListViewModelProtocol?
  private let coreDataStack = CoreDataStack.shared
  private var persons: [Person] = []
  private var personsFilter: [Person] = []
  private var personType: PersonType = .all

  public func delegate(delegate: PersonListViewModelProtocol?) {
    self.delegate = delegate
  }

  func fetchListPerson(type: PersonType) {
    personType = type
    let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

    switch type {
    case .all:
      break
    case .adults:
      fetchRequest.predicate = NSPredicate(format: "age >= 18")
    case .children:
      fetchRequest.predicate = NSPredicate(format: "age < 18")
    }

    do {
      persons = try coreDataStack.context.fetch(fetchRequest)
      personsFilter = persons
      delegate?.updateTableView()
    } catch {
      print("Deu ruim")
    }
  }

  func createPerson(name: String, age: String, cpf: String) {
    let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
    let containsCPF = try? coreDataStack.context.fetch(fetchRequest).contains(where: { $0.cpf == Int64(cpf) })

    if containsCPF ?? false {
       print("CPF já cadastrado")
      return
    }

    let person = Person(context: coreDataStack.context)
    person.name = name
    person.age = Int64(age) ?? 0
    person.cpf = Int64(cpf) ?? 0
    coreDataStack.saveContext()
    fetchListPerson(type: personType)
  }

  func deletePerson(indexPath: IndexPath) {
    let person = personsFilter[indexPath.row]
    coreDataStack.context.delete(person)
    coreDataStack.saveContext()
    fetchListPerson(type: personType)
  }

  func updatePerson(person: Person, name: String, age: String, cpf: String) {
    person.name = name
    person.age = Int64(age) ?? 0
    person.cpf = Int64(cpf) ?? 0
    coreDataStack.saveContext()
    fetchListPerson(type: personType)
  }

  var numberOfRows: Int {
    personsFilter.count
  }

  func loadCurrentPerson(indexPath: IndexPath) -> Person {
    personsFilter[indexPath.row]
  }

  func filterPerson(text: String) {
    if text.isEmpty {
      personsFilter = persons
      return
    }
    personsFilter = persons.filter({ $0.name?.lowercased().contains(text.lowercased()) ?? false})
  }


}
