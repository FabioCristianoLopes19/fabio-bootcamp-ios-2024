//
//  PersonListTableViewCell.swift
//  CoreDataBootcamp
//
//  Created by Fabio Cristiano Lopes on 30/09/24.
//

import UIKit

class PersonListTableViewCell: UITableViewCell {

  static let identifier: String = String(describing: PersonListTableViewCell.self)

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    return label
  }()

  lazy var ageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    return label
  }()

  lazy var cpfLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
    contentView.addSubview(ageLabel)
    contentView.addSubview(cpfLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

      ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

      cpfLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5),
      cpfLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      cpfLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      cpfLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
  }

  func setupCell(person: Person) {
    nameLabel.text = person.name
    ageLabel.text = "\(person.age)"
    cpfLabel.text = "\(person.cpf)"
  }
}
