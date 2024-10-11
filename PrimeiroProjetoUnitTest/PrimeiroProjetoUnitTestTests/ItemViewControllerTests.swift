//
//  ItemViewControllerTests.swift
//  PrimeiroProjetoUnitTestTests
//
//  Created by Fabio Cristiano Lopes on 10/10/24.
//

import XCTest
@testable import PrimeiroProjetoUnitTest

final class ItemViewControllerTests: XCTestCase {

  var viewController: ItemViewController!

  override func setUpWithError() throws {
    viewController = ItemViewController()
    viewController.loadViewIfNeeded()
  }

  override func tearDownWithError() throws {
    viewController = nil
  }

  func testViewControllerInitialization() throws {
    XCTAssertNotNil(viewController)
    XCTAssertNotNil(viewController.viewModel)
    XCTAssertNotNil(viewController.screen)
  }

  func testTableViewSetup() {
    XCTAssertNotNil(viewController.screen?.tableView)
    XCTAssertEqual(viewController.screen?.tableView.dataSource as? ItemViewController, viewController)
    XCTAssertEqual(viewController.screen?.tableView.delegate as? ItemViewController, viewController)
  }

  



}
