//
//  ViewController.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Fabio Cristiano Lopes on 22/07/24.
//

import UIKit

// MARK: - Arquitetura MVVM
// 3 - 4 - Camadas
// Model -> Responsável pela parte do Modelo (struct Person, struct Animal, etc...)
// View -> Responsável pela visualização/interação, muito conhecida por ser a camada BURRA. Declarada desta forma pois ela NÃO DEVE CONTER NENHUMA LÓGICA, por isso é chamada de "burra". (HomeViewController)
// ViewModel -> Camada intermediaria. Responsável por TODA parte lógica da tela. Camada responsável por MANTER O OBJETO DE FORMA PRIVADA! Tem a responsabilidade de interceptar toda a ação da view e comunicar a camada da model(HomeViewModel)
// Service -> Camada responsável pela parte de network


// Receita de bolo para TableView
// Assinar os protocols da tableView na VIEWCONTROLLER (delegate e o dataSource)
// Criar a celula do tipo UITableViewCell
// Registre sua celula na tableView!!! (tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier))
// Configure o numberOfRowsInSection e o cellForRowAt

class ListViewController: UIViewController {

  var screen: ListScreen?
  var viewModel: ListViewModel = ListViewModel()


  override func loadView() {
    screen = ListScreen()
    self.view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.tableView.delegate = self
    screen?.tableView.dataSource = self
  }

}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let person = viewModel.loadCurrentPerson(indexPath: indexPath)
    print(person.name)
  }
}

extension ListViewController: UITableViewDataSource {

  // retornar para tableView quantas LINHAS teremos na tabela
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection
  }

  // onde configuramos a nossa célula!!
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
    cell?.delegate = self
    cell?.setupCell(person: viewModel.loadCurrentPerson(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }
}

extension ListViewController: PersonTableViewCellProtocol {
  func tappedDeletePerson(person: Person?) {
    guard let person else { return }
    viewModel.deletePerson(person: person)
    screen?.tableView.reloadData()
  }
}
