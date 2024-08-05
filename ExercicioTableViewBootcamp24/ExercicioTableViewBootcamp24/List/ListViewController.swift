//
//  ViewController.swift
//  AppTableViewAvancado
//
//  Created by Fabio Cristiano Lopes on 29/07/24.
//

import UIKit

class ListViewController: UIViewController {

  var screen: ListScreen?
  var list: [Employee] = []

  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.delegate = self
    screen?.tableView.delegate = self
    screen?.tableView.dataSource = self
  }

  func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .cancel)
    alert.addAction(ok)
    present(alert, animated: true)
  }

  func employeeExists(name: String, job: String) -> Bool {
    return list.contains { $0 == Employee(name: name, job: job) }
  }

  func addEmployee(name: String, job: String) {
    list.append(Employee(name: name, job: job))
    screen?.tableView.reloadData()
  }

  func removeEmployee(name: String, job: String) {
    list.removeAll { $0 == Employee(name: name, job: job) }
    screen?.tableView.reloadData()
  }

}

extension ListViewController: ListScreenProtocol {

  func tappedAddButton() {

    let name = screen?.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    let job = screen?.jobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

    if name.isEmpty || job.isEmpty {
      showAlert(title: "Atenção!", message: "Preencha todas as informações para adicionar")
    } else if employeeExists(name: name, job: job) {
      showAlert(title: "Atenção!", message: "Já contém esse usuário")
    } else {
      addEmployee(name: name, job: job)
    }


//    guard !name.isEmpty && !job.isEmpty else {
//      showAlert(title: "Atenção!", message: "Preencha todas as informações para adicionar")
//      return
//    }
//
//    guard !employeeExists(name: name, job: job) else {
//      showAlert(title: "Atenção!", message: "Já contém esse usuário")
//      return
//    }
//
//    addEmployee(name: name, job: job)
  }

  func tappedRemoveButton() {
    guard let name = screen?.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
          !name.isEmpty,
          let job = screen?.jobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
          !job.isEmpty else {
      showAlert(title: "Atenção!", message: "Preencha todas as informações para remover o item")
      return
    }

    removeEmployee(name: name, job: job)
  }
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath.row)
  }
}

extension ListViewController: UITableViewDataSource {

  // numero de linhas por section
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.isEmpty ? 1 : list.count
  }

  // metodo responsavel pela criação das celulas
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if list.isEmpty {
      let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell
      return cell ?? UITableViewCell()
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
      cell?.setupCell(employee: list[indexPath.row])
      return cell ?? UITableViewCell()
    }
  }
}
