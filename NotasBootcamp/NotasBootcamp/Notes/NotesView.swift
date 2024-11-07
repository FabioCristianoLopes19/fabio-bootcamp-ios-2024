//
//  NotesView.swift
//  NotasBootcamp
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//

import SwiftUI

struct NotesView: View {

  @StateObject var viewModel = NoteViewModel()

  var body: some View {
    NavigationView {
      List($viewModel.notes, editActions: .all) { $note in
        NavigationLink(destination: NoteDetailView(note: $note)) {
          HStack {
            Image(systemName: "pencil")
            VStack(alignment: .leading) {
              Text(note.title)
              Text(note.content)
            }
          }
        }
      }
      .navigationTitle("Minhas notas")
    }
  }
}

#Preview {
  NotesView()
}
