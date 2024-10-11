//
//  ItemScreen.swift
//  PrimeiroProjetoUnitTest
//
//  Created by Fabio Cristiano Lopes on 09/10/24.
//

import UIKit

class ItemScreen: UIView {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    return tableView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
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
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  func configProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }

}
