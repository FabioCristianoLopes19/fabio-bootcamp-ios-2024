//
//  HeaderView.swift
//  CustomViewBootcamp
//
//  Created by Caio Fabrini on 12/08/24.
//

import Foundation
import UIKit

// Como criar um elemento customizável?
// Crie uma view apartada para o seu elemento
// Pense que o seu elemento ele é como se fosse uma label, um botão, um textField, etc...
// Esse elemento serve para que você possa REUTILIZA-LO EM QUALQUER LOCAL DO SEU APP!!
// Sendo assim, com ele você vai utiliza-lo como qualquer outro elemento
// Ex elementos básicos: lazy var nameTextField: UITextField
// Ex customizável     : lazy var headerView: HeaderView


class HeaderView: UIView {

  lazy var headerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 22)
    return label
  }()

  init(title: String, image: UIImage?) {
    super.init(frame: .zero)
    backgroundColor = .red
    addElements()
    configConstraints()
    configElements(title: title, image: image)
  }

  func configElements(title: String, image: UIImage?) {
    titleLabel.text = title
    headerImageView.image = image
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(headerImageView)
    addSubview(titleLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      headerImageView.topAnchor.constraint(equalTo: topAnchor),
      headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
    ])
  }
}
