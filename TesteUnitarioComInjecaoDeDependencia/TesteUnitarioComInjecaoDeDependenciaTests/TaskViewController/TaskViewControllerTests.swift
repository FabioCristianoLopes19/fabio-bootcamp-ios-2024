//
//  TaskViewControllerTests.swift
//  TesteUnitarioComInjecaoDeDependenciaTests
//
//  Created by Fabio Cristiano Lopes on 14/10/24.
//

import XCTest
@testable import TesteUnitarioComInjecaoDeDependencia

final class TaskViewControllerTests: XCTestCase {

  var viewController: TaskViewController!
  var spy: TaskViewModelProtocolSpy!
  var screen: TaskScreen!

  override func setUpWithError() throws {
    spy = TaskViewModelProtocolSpy()
    viewController = TaskViewController(viewModel: spy)
    viewController.loadViewIfNeeded()
    screen = viewController.screen
  }

  override func tearDownWithError() throws {
    viewController = nil
    spy = nil
    screen = nil
  }

  func testInitialLoadShowsEmptyList() throws {
    // Given:
    XCTAssertEqual(spy.numberOfRows, 0)
    // When:
    let rows = screen.tableView.numberOfRows(inSection: 0)
    // Then:
    XCTAssertEqual(rows, 0)
  }

  func testCompleteTaskViewModel() throws {
    // Given:
    spy.addTask(title: "Task Complete")

    // When:
    viewController.tableView(screen.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    viewController.reloadData()

    // Then:
    XCTAssertTrue(spy.didChangeTaskStatusCalled)
    XCTAssertTrue(spy.didAddTaskCalled)
  }

  func testRemoveTaskUpdateTableView() {
    // Given:
    spy.addTask(title: "Task Complete")
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    // When:
    viewController.tableView(screen.tableView, commit: .delete, forRowAt: indexPath)
    viewController.reloadData()
    // Then:
    XCTAssertTrue(spy.didRemoveTaskCalled)
    XCTAssertEqual(spy.numberOfRows, 0)
    XCTAssertEqual(screen.tableView.numberOfRows(inSection: 0), 0)
  }

  func testAddTaskUpdateTableView() {
    // Given:
    spy.addTask(title: "Task Add")
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    // When:
    viewController.reloadData()
    let cell = viewController.tableView(screen.tableView, cellForRowAt: indexPath)
    // Then:
    XCTAssertTrue(spy.didAddTaskCalled)
    XCTAssertEqual(spy.numberOfRows, 1)
    XCTAssertEqual(screen.tableView.numberOfRows(inSection: 0), 1)
    XCTAssertEqual(cell.textLabel?.text, "Task Add")
  }

  func testFetchTasksOnViewDidLoad() {
    // Then:
    XCTAssertTrue(spy.fetchTasksCalled)
  }
}
