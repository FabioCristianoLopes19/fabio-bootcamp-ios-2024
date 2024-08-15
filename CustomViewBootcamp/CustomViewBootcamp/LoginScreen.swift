//
//  LoginScreen.swift
//  CustomViewBootcamp
//
//  Created by Caio Fabrini on 12/08/24.
//

import Foundation
import UIKit

class LoginScreen: UIView {

  lazy var headerView: HeaderView = {
    let view = HeaderView(title: "Login", image: UIImage(named: "topBackGround"))
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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
    addSubview(headerView)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: topAnchor),
      headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 200),
    ])
  }
}
