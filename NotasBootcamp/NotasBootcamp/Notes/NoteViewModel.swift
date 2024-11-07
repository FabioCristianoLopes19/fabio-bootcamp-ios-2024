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

  @Published var notes: [Note] = [
    Note(title: "Teste 1", content: "conteudo 1"),
    Note(title: "Teste 2", content: "conteudo 2"),
    Note(title: "Teste 3", content: "conteudo 3"),
    Note(title: "Teste 4", content: "conteudo 4")
  ]


}
