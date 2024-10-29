//
//  TaskViewModelTests.swift
//  TesteUnitarioComInjecaoDeDependenciaTests
//
//  Created by Fabio Cristiano Lopes on 14/10/24.
//

import XCTest
@testable import TesteUnitarioComInjecaoDeDependencia

// Oque é o @testable?
// O @testable é um modificador de acesso que permite que outro modulo(pod) tenha acesso ao seu codigo como se fosse 'public'


// Given: Define o cenário inicial, preparando os dados ou o estado do mesmo.
// When:  Executa a ação que está sendo TESTADA, como adicionar, remover, completar uma tarefa...
// Then:  Verifica os resultado esperados, garantindo que as mudanças foram aplicadas/executadas corretamente.

// Oque é um Spy?

// Um Spy ou classe espiã -> é uma implementação de testes que age como se fosse um observador. Ele é feito para capturar e armazenar detalhes sobre o uso do método e propriedades. Com o Spy você pode:
// - Verificar a quantidade de vezes que o método foi chamado e contabilizar
// - Capturar parâmetros que foram passados nos métodos

class ServiceProtocolSpy: ServiceProtocol {

  var fetchTasksCalled: Bool = false
  var fetchTasksCompletion: ((Result<[Task], any Error>) -> Void)?

  func fetchTasks(completion: @escaping (Result<[Task], any Error>) -> Void) {
    fetchTasksCalled = true
    fetchTasksCompletion = completion
  }
}

final class TaskViewModelTests: XCTestCase {

  var viewModel: TaskViewModel!
  var spy: TaskViewModelDelegateSpy!
  var serviceSpy: ServiceProtocolSpy!

  override func setUpWithError() throws {
    serviceSpy = ServiceProtocolSpy()
    viewModel = TaskViewModel(service: serviceSpy)
    spy = TaskViewModelDelegateSpy()
    viewModel.delegate = spy
  }

  override func tearDownWithError() throws {
    viewModel = nil
    spy = nil
    serviceSpy = nil
  }

  func testAddTask() throws {
    // Given:
    let title = "New Task"
    // When:
    viewModel.addTask(title: title)
    // Then:
    XCTAssertEqual(viewModel.numberOfRows, 1)
    XCTAssertEqual(viewModel.loadCurrentTask(indexPath: IndexPath(row: 0, section: 0)).title, title)
    XCTAssertTrue(spy.didReloadDataCalled)
  }

  func testChangeTaskStatus() {
    // Given:
    viewModel.addTask(title: "New Task")
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    // When:
    viewModel.changeTaskStatus(indexPath: indexPath)
    // Then:
    XCTAssertTrue(viewModel.loadCurrentTask(indexPath: indexPath).isCompleted)
    XCTAssertTrue(spy.didReloadDataCalled)
  }

  func testRemoveTask() {
    // Given:
    viewModel.addTask(title: "New Task")
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    // When:
    viewModel.removeTask(indexPath: indexPath)
    // Then:
    XCTAssertTrue(viewModel.numberOfRows == 0)
    XCTAssertEqual(viewModel.numberOfRows, 0)
    XCTAssertTrue(spy.didReloadDataCalled)
  }

  func testFetchTasksSuccess() {
    // Given:
    let task1 = Task(id: UUID(), title: "Teste 1", isCompleted: false)
    let task2 = Task(id: UUID(), title: "Teste 2", isCompleted: true)
    let taskList = [task1, task2]
    // When:
    viewModel.fetchTasks()
    serviceSpy.fetchTasksCompletion?(.success(taskList))

    // Then:
    XCTAssertTrue(serviceSpy.fetchTasksCalled)
    XCTAssertEqual(viewModel.numberOfRows, 2)
    XCTAssertEqual(viewModel.loadCurrentTask(indexPath: IndexPath(row: 0, section: 0)).title, task1.title)
  }

   func testFetchTasksFailure() {
     // When:
     viewModel.fetchTasks()
     serviceSpy.fetchTasksCompletion?(.failure(NSError(domain: "Error", code: -1)))

     // Then:
     XCTAssertTrue(serviceSpy.fetchTasksCalled)
     XCTAssertEqual(viewModel.numberOfRows, 0)
  }

  func testFetchDeallocated() {
    weak var weakViewModel: TaskViewModel?

    autoreleasepool {
      var viewModel: TaskViewModel? = TaskViewModel(service: serviceSpy)
      weakViewModel = viewModel
      viewModel?.fetchTasks()

      XCTAssertNotNil(weakViewModel)

      serviceSpy.fetchTasksCompletion?(.success([]))
      viewModel = nil
    }
    
    XCTAssertNil(weakViewModel)
  }

  func testFetchRequestDeallocatedBeforeTasksCompletion() {
      // Given:
    weak var weakViewModel: TaskViewModel?

    autoreleasepool {
      var viewModel: TaskViewModel? = TaskViewModel(service: serviceSpy)
      weakViewModel = viewModel

      // When:
      viewModel?.fetchTasks()
      viewModel = nil
      serviceSpy.fetchTasksCompletion?(.success([]))

      // Then:
      XCTAssertNil(weakViewModel)
      XCTAssertEqual(weakViewModel?.numberOfRows, nil)
    }
  }


}
