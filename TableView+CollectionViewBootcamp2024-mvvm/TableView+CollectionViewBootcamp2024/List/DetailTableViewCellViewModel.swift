//
//  DetailTableViewCellViewModel.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Fabio Cristiano Lopes on 08/08/24.
//

import Foundation

class DetailTableViewCellViewModel {
  private var detail: Detail?

  func setDetail(detail: Detail) {
    self.detail = detail
  }

  var numberOfItemsInSection: Int {
    return detail?.list.count ?? 0
  }

  func loadCurrentItem(indexPath: IndexPath) -> Item {
    return detail?.list[indexPath.row] ?? Item(text: "", image: "")
  }

  func getTitle(indexPath: IndexPath) -> String {
    return loadCurrentItem(indexPath: indexPath).text
  }
}
