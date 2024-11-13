//
//  NoteViewModel.swift
//  NotasBootcamp
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//


import Foundation

// @ObservedObject é usado em uma View para reagir a mudanças em um ObservableObject.

// @StateObject é similar a @ObservedObject, mas é responsável pela criação e destruição do objeto observado, sendo mais apropriado para objetos que a view deve possuir.

// @Published é utilizado para notificar mudanças em propriedades de um ObservableObject.

class NoteViewModel: ObservableObject {
  @Published var notes: [Note] = [] {
    didSet {
      saveNotes()
    }
  }

  init() {
    guard let data = UserDefaults.standard.data(forKey: "notes"),
          let list = try? JSONDecoder().decode([Note].self, from: data) else { return }
    notes = list
  }

  func saveNotes() {
    UserDefaults.standard.set(try? JSONEncoder().encode(notes), forKey: "notes")
  }
}
