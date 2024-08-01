//
//  ViewController.swift
//  AppTableViewAvancado
//
//  Created by Fabio Cristiano Lopes on 29/07/24.
//

import UIKit

class ListViewController: UIViewController {

  var screen: ListScreen?

  var list: [Employee] = [Employee(
    name: "Caio Fabrini",
    age: 22,
    job: "empresario",
    salary: 10000,
    isSelectedHeart: false
  ), Employee(
    name: "Bárbara Fabrini",
    age: 22,
    job: "empresario",
    salary: 10000,
    isSelectedHeart: true
  ), Employee(
    name: "Jose Assis",
    age: 22,
    job: "empresario",
    salary: 10000,
    isSelectedHeart: true
  ), Employee(
    name: "Fabio Lopes",
    age: 22,
    job: "empresario",
    salary: 10000,
    isSelectedHeart: false
  ),Employee(
    name: "Eduardo Abido",
    age: 22,
    job: "empresario",
    salary: 10000,
    isSelectedHeart: true),
                          Employee(name: "Alice Johnson", age: 30, job: "Software Engineer", salary: 120000, isSelectedHeart: false),
                          Employee(name: "Bob Smith", age: 45, job: "Project Manager", salary: 95000, isSelectedHeart: true),
                          Employee(name: "Carol White", age: 28, job: "Data Scientist", salary: 110000, isSelectedHeart: false),
                          Employee(name: "David Brown", age: 35, job: "Product Owner", salary: 105000, isSelectedHeart: true),
                          Employee(name: "Eve Davis", age: 40, job: "UX Designer", salary: 90000, isSelectedHeart: false),
                          Employee(name: "Frank Wilson", age: 50, job: "CTO", salary: 150000, isSelectedHeart: true),
                          Employee(name: "Grace Miller", age: 26, job: "Marketing Specialist", salary: 70000, isSelectedHeart: false),
                          Employee(name: "Hank Taylor", age: 38, job: "DevOps Engineer", salary: 115000, isSelectedHeart: true),
                          Employee(name: "Ivy Anderson", age: 32, job: "HR Manager", salary: 85000, isSelectedHeart: false),
                          Employee(name: "Jack Thomas", age: 29, job: "Sales Executive", salary: 80000, isSelectedHeart: true)
  ]

  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.tableView.delegate = self
    screen?.tableView.dataSource = self
  }

}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let employee = list[indexPath.row]
    print(employee.name)
  }
}

extension ListViewController: UITableViewDataSource {

  // numero de linhas por section
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  // metodo responsavel pela criação das celulas
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
    cell?.delegate = self
    cell?.setupCell(employee: list[indexPath.row])
    return cell ?? UITableViewCell()
  }
}

extension ListViewController: EmployeeTableViewCellProtocol {
  func tappedUpdateHeartButton(employee: Employee) {
    if let index = list.firstIndex(of: employee) {
      list[index].isSelectedHeart.toggle()
    }
  }
}

