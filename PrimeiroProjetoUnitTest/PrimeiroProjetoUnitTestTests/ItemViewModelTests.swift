//
//  ItemViewModelTests.swift
//  PrimeiroProjetoUnitTestTests
//
//  Created by Fabio Cristiano Lopes on 10/10/24.
//

import XCTest
@testable import PrimeiroProjetoUnitTest

final class ItemViewModelTests: XCTestCase {

  var itemViewModel: ItemViewModel!

  override func setUpWithError() throws {
    itemViewModel = ItemViewModel()
  }

  override func tearDownWithError() throws {
    itemViewModel = nil
  }

  func testAddItemValidationContainsList() {
    itemViewModel.addItem(title: "Test Item", description: "Test Description")
    XCTAssertTrue(itemViewModel.items.count == 1)
  }

  func testAddItemValidationEqualResult() {
    let title = "Test Item"
    let description = "Test Description"

    itemViewModel.addItem(title: title, description: description)

    XCTAssertTrue(itemViewModel.items[0].title == title)
    XCTAssertTrue(itemViewModel.items[0].description == description)
  }

  func testRemoveItemList() {
    itemViewModel.addItem(title: "Test Item", description: "Test Description")
    itemViewModel.removeItem(indexPath: IndexPath(row: 0, section: 0))
    XCTAssertTrue(itemViewModel.items.isEmpty)
    // Outra opção
    // XCTAssertEqual(itemViewModel.items.count, 0)
  }

  func testUpdateItem() {
    itemViewModel.addItem(title: "Old Item", description: "Old Description")
    itemViewModel.updateItem(indexPath: IndexPath(row: 0, section: 0), title: "New Item", description: "New Description")
    XCTAssertTrue(itemViewModel.items[0].title == "New Item")
    XCTAssertTrue(itemViewModel.items[0].description == "New Description")
  }

  func testLoadCurrentItem() {
    itemViewModel.addItem(title: "Test Item", description: "Test Description")

    let item = itemViewModel.loadCurrentItem(indexPath: IndexPath(row: 0, section: 0))
    XCTAssertTrue(item.title == "Test Item")
    XCTAssertTrue(item.description == "Test Description")
  }
}
