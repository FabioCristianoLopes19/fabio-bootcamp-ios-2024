//
//  ListScreen.swift
//  AppTableViewAvancado
//
//  Created by Caio Fabrini on 29/07/24.
//

import UIKit

protocol ListScreenProtocol: AnyObject {
  func tappedAddButton()
  func tappedRemoveButton()
}

class ListScreen: UIView {

  weak var delegate: ListScreenProtocol?

  lazy var nameTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Nome:"
    tf.borderStyle = .roundedRect
    return tf
  }()

  lazy var jobTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Trabalho:"
    tf.borderStyle = .roundedRect
    return tf
  }()

  lazy var addButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Adicionar", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    return button
  }()

  lazy var removeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Remover", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedRemoveButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedRemoveButton() {
    delegate?.tappedRemoveButton()
  }

  @objc func tappedAddButton() {
    delegate?.tappedAddButton()
  }

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    tableView.register(EmptyTableViewCell.self, forCellReuseIdentifier: EmptyTableViewCell.identifier)
    tableView.separatorStyle = .none
    return tableView
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .orange
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(nameTextField)
    addSubview(jobTextField)
    addSubview(addButton)
    addSubview(removeButton)
    addSubview(tableView)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      
      nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      jobTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
      jobTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      jobTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      addButton.topAnchor.constraint(equalTo: jobTextField.bottomAnchor, constant: 12),
      addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      addButton.heightAnchor.constraint(equalToConstant: 40),

      removeButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 12),
      removeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      removeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      removeButton.heightAnchor.constraint(equalToConstant: 40),

      tableView.topAnchor.constraint(equalTo: removeButton.bottomAnchor, constant: 20),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}

