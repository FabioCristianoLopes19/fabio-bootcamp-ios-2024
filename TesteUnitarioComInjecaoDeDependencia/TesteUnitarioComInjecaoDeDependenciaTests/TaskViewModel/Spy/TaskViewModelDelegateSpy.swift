//
//  TaskViewModelDelegateSpy.swift
//  TesteUnitarioComInjecaoDeDependencia
//
//  Created by Fabio Cristiano Lopes on 14/10/24.
//

import XCTest
@testable import TesteUnitarioComInjecaoDeDependencia

class TaskViewModelDelegateSpy: TaskViewModelDelegate {
  var didReloadDataCalled: Bool = false

  func reloadData() {
    didReloadDataCalled = true
  }
}
