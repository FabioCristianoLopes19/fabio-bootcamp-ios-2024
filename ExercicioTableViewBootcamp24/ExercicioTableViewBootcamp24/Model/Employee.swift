//
//  Employee.swift
//  AppTableViewAvancado
//
//  Created by Caio Fabrini on 29/07/24.
//

import Foundation

struct Employee: Equatable {
  var name: String
  var job: String
  
  static func == (lhs: Employee, rhs: Employee) -> Bool {
    return lhs.name == rhs.name &&
    lhs.job == rhs.job
  }
}

