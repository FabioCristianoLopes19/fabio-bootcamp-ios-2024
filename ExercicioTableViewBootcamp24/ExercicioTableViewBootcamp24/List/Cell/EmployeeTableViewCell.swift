//
//  EmployeeTableViewCell.swift
//  AppTableViewAvancado
//
//  Created by Fabio Cristiano Lopes on 29/07/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

  static let identifier: String = String(describing: EmployeeTableViewCell.self)

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "Caio Fabrini"
    return label
  }()

  lazy var jobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "iOS developer"
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addElements()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(jobLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

      jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      jobLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      jobLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
    ])
  }

  func setupCell(employee: Employee) {
    nameLabel.text = "Nome: \(employee.name)"
    jobLabel.text = "Profissão: \(employee.job)"
  }

}
