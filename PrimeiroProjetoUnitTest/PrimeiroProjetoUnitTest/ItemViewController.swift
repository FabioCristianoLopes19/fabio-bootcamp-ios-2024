//
//  ViewController.swift
//  PrimeiroProjetoUnitTest
//
//  Created by Fabio Cristiano Lopes on 09/10/24.
//

import UIKit

class ItemViewController: UIViewController {

  var screen: ItemScreen?
  var viewModel: ItemViewModel = ItemViewModel()

  override func loadView() {
    screen = ItemScreen()
    view = screen
  }

  override func viewWillAppear(_ animated: Bool) {
    setupNavigationBar()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.configProtocols(delegate: self,
                            dataSource: self)
  }

  private func setupNavigationBar() {
    navigationItem.title = "Items"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedAddItem))
  }

  @objc func tappedAddItem() {
    showAlertForNewItem()
  }

  func showAlertForNewItem() {
    let alert = UIAlertController(title: "New Item", message: nil, preferredStyle: .alert)

    alert.addTextField { textField in
      textField.placeholder = "Title"
    }

    alert.addTextField { textField in
      textField.placeholder = "Description"
    }

    alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
      guard let self else { return }

      let firstText = alert.textFields?.first?.text ?? ""
      let lastText = alert.textFields?.last?.text ?? ""

      viewModel.addItem(title: firstText, description: lastText)
      screen?.tableView.reloadData()
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alert, animated: true)
  }

  func showAlertForUpDateNewItem(index: IndexPath) {
    let alert = UIAlertController(title: "Update new Item", message: nil, preferredStyle: .alert)
  
    let objc = viewModel.loadCurrentItem(indexPath: index)
  
    alert.addTextField { textField in
      textField.placeholder = "Title"
      textField.text = objc.title
    }
  
    alert.addTextField { textField in
      textField.placeholder = "Description"
      textField.text = objc.description
    }

    alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
      guard let self else { return }
  
      let firstText = alert.textFields?.first?.text ?? ""
      let lastText = alert.textFields?.last?.text ?? ""
  
      viewModel.updateItem(indexPath: index, title: firstText, description: lastText)
      screen?.tableView.reloadData()
    }))

    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

    present(alert, animated: true)
  }
}

extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfIRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let object = viewModel.loadCurrentItem(indexPath: indexPath)
    cell.textLabel?.text = object.title
    return cell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      viewModel.removeItem(indexPath: indexPath)
      screen?.tableView.reloadData()
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    showAlertForUpDateNewItem(index: indexPath)
  }
}

