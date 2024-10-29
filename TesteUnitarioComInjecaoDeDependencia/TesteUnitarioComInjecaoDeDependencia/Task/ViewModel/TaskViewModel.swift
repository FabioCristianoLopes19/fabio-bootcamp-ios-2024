//
//  TaskViewModel.swift
//  TesteUnitarioComInjecaoDeDependencia
//
//  Created by Fabio Cristiano Lopes on 10/10/24.
//

import Foundation


protocol ServiceProtocol {
  func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void)
}

class Service: ServiceProtocol {
  func fetchTasks(completion: @escaping (Result<[Task], any Error>) -> Void) {
    // logica para API -> URLSession....
    completion(.success([]))
  }
}

protocol TaskViewModelDelegate: AnyObject {
    func reloadData()
}

protocol TaskViewModelProtocol: AnyObject {
  var numberOfRows: Int { get }
  var delegate: TaskViewModelDelegate? { get set }
  func loadCurrentTask(indexPath: IndexPath) -> Task
  func addTask(title: String)
  func changeTaskStatus(indexPath: IndexPath)
  func removeTask(indexPath: IndexPath)
  func fetchTasks()
}

class TaskViewModel {
  weak var delegate: TaskViewModelDelegate?
  private var tasks: [Task] = []
  let service: ServiceProtocol

  init(service: ServiceProtocol = Service()) {
    self.service = service
  }
}

extension TaskViewModel: TaskViewModelProtocol {
  var numberOfRows: Int {
    return tasks.count
  }
  
  func loadCurrentTask(indexPath: IndexPath) -> Task {
    return tasks[indexPath.row]
  }
  
  func addTask(title: String) {
    let newTask = Task(id: UUID(), title: title, isCompleted: false)
    tasks.append(newTask)
    delegate?.reloadData()
  }
  
  func changeTaskStatus(indexPath: IndexPath) {
    tasks[indexPath.row].isCompleted.toggle()
    delegate?.reloadData()
  }
  
  func removeTask(indexPath: IndexPath) {
    tasks.remove(at: indexPath.row)
    delegate?.reloadData()
  }

  // MARK: Método com que evita MEMORY LEAK
  func fetchTasks() {
     service.fetchTasks { [weak self] result in
      guard let self else { return }
      switch result {
      case .success(let tasks):
        self.tasks = tasks
        delegate?.reloadData()
      case .failure:
        break
      }
    }
  }

// MARK: Método com MEMORY LEAK
//  func fetchTasks() {
//     service.fetchTasks { result in
//      switch result {
//      case .success(let tasks):
//        self.tasks = tasks
//        self.delegate?.reloadData()
//      case .failure:
//        break
//      }
//    }
//  }
}
