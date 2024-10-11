//
//  ItemViewModel.swift
//  PrimeiroProjetoUnitTest
//
//  Created by Fabio Cristiano Lopes on 09/10/24.
//

import Foundation

class ItemViewModel {
  private(set) var items: [Item] = []

  var numberOfIRows: Int {
    items.count
  }

  func loadCurrentItem(indexPath: IndexPath) -> Item {
    return items[indexPath.row]
  }

  func addItem(title: String, description: String) {
    let newItem = Item(id: UUID(), title: title, description: description)
    items.append(newItem)
  }

  func updateItem(indexPath: IndexPath, title: String, description: String) {
    items[indexPath.row].title = title
    items[indexPath.row].description = description
  }

  func removeItem(indexPath: IndexPath) {
    items.remove(at: indexPath.row)
  }
}
