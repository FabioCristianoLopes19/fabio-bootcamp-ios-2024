//
//  TaskScreen.swift
//  TesteUnitarioComInjecaoDeDependencia
//
//  Created by Fabio Cristiano Lopes on 10/10/24.
//

import UIKit

class TaskScreen: UIView {
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.backgroundColor = .white
    tableView.separatorStyle = .singleLine
    return tableView
  }()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    addElements()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addElements() {
    addSubview(tableView)
  }
  
  func configConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
  
  func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
}
