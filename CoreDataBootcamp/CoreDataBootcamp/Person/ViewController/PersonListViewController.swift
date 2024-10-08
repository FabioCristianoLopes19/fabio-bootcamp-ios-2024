//
//  ViewController.swift
//  CoreDataBootcamp
//
//  Created by Fabio Cristiano Lopes on 30/09/24.
//

import UIKit

/*
--------------------------------------
VANTAGENS DO CORE DATA
--------------------------------------

1. **Integração com o iOS**:
   - O Core Data é profundamente integrado ao iOS, sendo uma solução nativa e bem otimizada para gerenciamento de dados locais em aplicativos.
   - Tem suporte a diversos recursos, validação de dados, e monitoramento de mudanças.

2. **Persistência de Dados Completa**:
   - O Core Data não apenas armazena dados, mas também gerencia o ciclo de vida dos objetos, serialização, e suporte a gráficos de objetos complexos.
   - Ele pode armazenar dados em vários formatos, incluindo SQLite, arquivos binários e até em memória.

3. **Eficiência em Consultas (Fetch)**:
   - O Core Data tem um poderoso sistema de consultas (NSFetchRequest), que é otimizado para realizar buscas eficientes em grandes conjuntos de dados, especialmente se estiver usando o backend SQLite.

4. **Suporte a Mapeamento de Objetos**:
   - Ele permite trabalhar diretamente com objetos Swift, o que significa que podemos lidar com entidades como objetos regulares (sem a necessidade de converter para SQL ou outro formato de banco de dados).

--------------------------------------
DESVANTAGENS DO CORE DATA
--------------------------------------

1. **Curva de Aprendizado**:
   - O Core Data pode ser complexo de configurar corretamente, e a curva de aprendizado pode ser mais íngreme para desenvolvedores iniciantes.
   - Há muitos conceitos a entender, como contextos de objetos (NSManagedObjectContext), relacionamentos, merge policies, e persistência.

2. **Não Ideal para Dados Simples**:
   - Para aplicativos com necessidades simples de persistência (como armazenamento de preferências de usuário), o Core Data pode ser excessivamente complexo.
   - Para dados simples, soluções como `UserDefaults` ou até mesmo `FileManager` podem ser mais fáceis e diretas.

3. **Desempenho em Grandes Volumes de Dados**:
   - Embora o Core Data seja eficiente para muitas aplicações, o desempenho pode se degradar ao lidar com grandes volumes de dados ou consultas complexas sem otimizações adequadas.
   - Consultas mal otimizadas, uso inadequado de índices e falta de normalização podem causar lentidão significativa.

4. **Falta de Sincronização Nativa**:
   - Diferentemente de algumas soluções baseadas em cloud, o Core Data não tem suporte nativo para sincronização automática entre dispositivos, exigindo configurações complexas como o uso do iCloud ou backends personalizados.

5. **Concurrency Complexity**:
   - Lidar com a concorrência no Core Data pode ser complicado. Cada thread precisa de seu próprio `NSManagedObjectContext`, e o desenvolvedor precisa ter cuidado para evitar condições de corrida ou inconsistências de dados.

--------------------------------------
QUANDO UTILIZAR O CORE DATA?
--------------------------------------
- O Core Data é ideal para aplicativos que requerem:
  - Persistência complexa com relacionamentos entre objetos.
  - Estruturas de dados que precisam ser consultadas frequentemente e/ou modificadas.

- **Alternativas ao Core Data**:
  - Para persistência simples, considere `UserDefaults` ou `Keychain`.
  - Para grandes volumes de dados, ou quando precisar de flexibilidade de consultas SQL, o uso direto de `SQLite` ou bibliotecas como `Realm` podem ser mais adequados.
*/



class PersonListViewController: UIViewController {

  var screen: PersonListScreen?
  var viewModel = PersonListViewModel()

  override func loadView() {
    screen = PersonListScreen()
    view = screen
  }

  override func viewWillAppear(_ animated: Bool) {
    configNavigation()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
    fetchAllData()
  }

  func fetchAllData() {
    viewModel.fetchListPerson(type: .all)
  }

  func configProtocols() {
    screen?.delegate(delegate: self)
    screen?.configSearchBarProtocol(delegate: self)
    screen?.configTableViewProtocols(delegate: self,
                                     dataSource: self)
    viewModel.delegate(delegate: self)
  }

  func configNavigation() {
    title = "CRUD Core Data"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
  }

  @objc func addPerson() {
    let alertController = UIAlertController(title: "Nova Pessoa", message: nil, preferredStyle: .alert)

    alertController.addTextField { textField in
      textField.placeholder = "CPF"
      textField.keyboardType = .numberPad
    }

    alertController.addTextField { textField in
      textField.placeholder = "Nome"
    }

    alertController.addTextField { textField in
      textField.placeholder = "Idade"
      textField.keyboardType = .numberPad
    }

    let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

    let addAction = UIAlertAction(title: "Adicionar", style: .default) { [weak self] _ in
      guard let self else { return }
      let cpf = alertController.textFields?.first?.text ?? ""
      let name = alertController.textFields?[1].text ?? ""
      let age = alertController.textFields?.last?.text ?? ""

      viewModel.createPerson(name: name, age: age, cpf: cpf)
    }

    alertController.addAction(addAction)
    alertController.addAction(cancel)
    present(alertController, animated: true, completion: nil)
  }

}

extension PersonListViewController: PersonListScreenProtocol {
  func changePersonType(to type: PersonType) {
    viewModel.fetchListPerson(type: type)
  }
}

extension PersonListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PersonListTableViewCell.identifier, for: indexPath) as? PersonListTableViewCell
    cell?.setupCell(person: viewModel.loadCurrentPerson(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      viewModel.deletePerson(indexPath: indexPath)
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    showEditPersonAlert(indexPath: indexPath)
  }

}

extension PersonListViewController {


  func showEditPersonAlert(indexPath: IndexPath) {
    let person = viewModel.loadCurrentPerson(indexPath: indexPath)

    let alert = UIAlertController(title: "Editar Pessoa", message: nil, preferredStyle: .alert)

    alert.addTextField { textField in
      textField.placeholder = "CPF"
      textField.text = String(person.cpf)
      textField.keyboardType = .numberPad
    }

    alert.addTextField { textField in
      textField.placeholder = "Nome"
      textField.text = person.name
    }

    alert.addTextField { textField in
      textField.placeholder = "Idade"
      textField.text = String(person.age)
      textField.keyboardType = .numberPad
    }

    let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

    let addAction = UIAlertAction(title: "Atualizar", style: .default) { [weak self] _ in
      guard let self else { return }
      let cpf = alert.textFields?.first?.text ?? ""
      let name = alert.textFields?[1].text ?? ""
      let age = alert.textFields?.last?.text ?? ""

      viewModel.updatePerson(person: person, name: name, age: age, cpf: cpf)
    }

    alert.addAction(addAction)
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
  }
}

extension PersonListViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.filterPerson(text: searchText)
    screen?.tableView.reloadData()
  }
}

extension PersonListViewController: PersonListViewModelProtocol {
  func updateTableView() {
    screen?.tableView.reloadData()
  }
}










