//
//  TaskViewModelProtocolSpy.swift
//  TesteUnitarioComInjecaoDeDependencia
//
//  Created by Fabio Cristiano Lopes on 17/10/24.
//

import XCTest
@testable import TesteUnitarioComInjecaoDeDependencia

class TaskViewModelProtocolSpy: TaskViewModelProtocol {
  var tasks: [Task] = []
  var didAddTaskCalled: Bool = false
  var didChangeTaskStatusCalled: Bool = false
  var didRemoveTaskCalled: Bool = false
  var fetchTasksCalled: Bool = false

  var numberOfRows: Int {
    return tasks.count
  }

  weak var delegate: TaskViewModelDelegate?

  func loadCurrentTask(indexPath: IndexPath) -> Task {
    tasks[indexPath.row]
  }

  func addTask(title: String) {
    didAddTaskCalled.toggle()
    tasks.append(Task(id: UUID(), title: title, isCompleted: false))
    delegate?.reloadData()
  }

  func changeTaskStatus(indexPath: IndexPath) {
    didChangeTaskStatusCalled.toggle()
    var task = tasks[indexPath.row]
    task.isCompleted.toggle()
    delegate?.reloadData()
  }

  func removeTask(indexPath: IndexPath) {
    didRemoveTaskCalled.toggle()
    tasks.remove(at: indexPath.row)
    delegate?.reloadData()
  }

  func fetchTasks() {
    fetchTasksCalled.toggle()
    delegate?.reloadData()
  }
}
