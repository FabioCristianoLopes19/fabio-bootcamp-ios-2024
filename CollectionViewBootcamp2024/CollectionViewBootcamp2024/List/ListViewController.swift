//
//  ViewController.swift
//  CollectionViewBootcamp2024
//
//  Created by Fabio Cristiano Lopes on 01/08/24.
//

import UIKit

class ListViewController: UIViewController {

  var screen: ListScreen?

  var list = [Detail(text: "Olá mundo", image: "house"),
              Detail(text: "Quero ferias agora", image: "house"),
              Detail(text: "Bora estudar?", image: "house"),
              Detail(text: "Iphone", image: "house"),
              Detail(text: "Ferias em Maldivas", image: "house"),
              Detail(text: "Ferias em Nuporanga", image: "house")]

  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.configCollectionViewProtocols(delegate: self, dataSource: self)
  }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell
    cell?.setupCell(detail: list[indexPath.row])
    return cell ?? UICollectionViewCell()
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return DetailCollectionViewCell.calculateSize(title: list[indexPath.row].text)
  }
}

