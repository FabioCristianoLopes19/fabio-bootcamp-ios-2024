//
//  ViewController.swift
//  TesteUnitarioComInjecaoDeDependencia
//
//  Created by Fabio Cristiano Lopes on 10/10/24.
//

import UIKit

class TaskViewController: UIViewController {
  var screen: TaskScreen?
  var viewModel: TaskViewModelProtocol

  init(viewModel: TaskViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    screen = TaskScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    viewModel.delegate = self
    screen?.configTableViewProtocols(delegate: self, dataSource: self)
    viewModel.fetchTasks()
  }

  func setupNavigationBar() {
    title = "TO-DO LIST"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
  }

  @objc func addTask () {
    let alertController = UIAlertController(title: "New Task", message: "Enter task title", preferredStyle: .alert)

    alertController.addTextField { textField in
      textField.placeholder = "Task title"
    }

    let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
      guard let self else { return }
      if let title = alertController.textFields?.first?.text, title != "" {
        viewModel.addTask(title: title)
      }
    }

    alertController.addAction(addAction)
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(alertController, animated: true)
  }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let task = viewModel.loadCurrentTask(indexPath: indexPath)
    cell.textLabel?.text = task.title
    cell.accessoryType = task.isCompleted ? .checkmark : .none
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.changeTaskStatus(indexPath: indexPath)
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      viewModel.removeTask(indexPath: indexPath)
    }
  }
}

extension TaskViewController: TaskViewModelDelegate {
  func reloadData() {
    screen?.tableView.reloadData()
  }
}
