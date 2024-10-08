//
//  PersonListScreen.swift
//  CoreDataBootcamp
//
//  Created by Fabio Cristiano Lopes on 30/09/24.
//

import UIKit

enum PersonType: Int, CaseIterable {
  case all = 0
  case adults = 1
  case children = 2

  var text : String {
    switch self {
    case .all: return "Todos"
    case .adults: return "Adultos"
    case .children: return "Crianças"
    }
  }
}

protocol PersonListScreenProtocol: AnyObject {
  func changePersonType(to type: PersonType)
}

class PersonListScreen: UIView {

  private weak var delegate: PersonListScreenProtocol?

  public func delegate(delegate: PersonListScreenProtocol?) {
    self.delegate = delegate
  }

  lazy var segmentedControl: UISegmentedControl = {
    //    let list = PersonType.allCases.map(\.text)
    //    let segmentedControl = UISegmentedControl(items: [PersonType.all.text,
    //                                                      PersonType.adults.text,
    //                                                      PersonType.children.text])
    //    Ou segunda abordagem ⬇️
    //  OBS: allCases é um array do enum [PersonType.all.text,
    //                                      PersonType.adults.text,
    //                                      PersonType.children.text]

    let list = PersonType.allCases.map(\.text)
    let segmentedControl = UISegmentedControl(items: list)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = PersonType.all.rawValue
    segmentedControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
    return segmentedControl
  }()

  @objc func segmentValueChanged(_ sender: UISegmentedControl) {
    delegate?.changePersonType(to: PersonType(rawValue: sender.selectedSegmentIndex) ?? .all)
  }

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(PersonListTableViewCell.self, forCellReuseIdentifier: PersonListTableViewCell.identifier)
    return tableView
  }()

  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.placeholder = "Pesquise pelo nome:"
    return searchBar
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
    addSubview(segmentedControl)
    addSubview(tableView)
    addSubview(searchBar)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      searchBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }

  func configSearchBarProtocol(delegate: UISearchBarDelegate) {
    searchBar.delegate = delegate
  }
}
