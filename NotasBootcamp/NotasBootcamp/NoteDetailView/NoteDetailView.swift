//
//  NoteDetailView.swift
//  NotasBootcamp
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//

import SwiftUI

struct NoteDetailView: View {

  @Environment(\.dismiss) var dismiss

  @Binding var note: Note
  @State var noteState: Note

  init(note: Binding<Note>) {
    _note = note
    _noteState = .init(initialValue: note.wrappedValue)
  }

  var body: some View {
    VStack {
      TextField("Título", text: $noteState.title)
        .font(.title)
      TextEditor(text: $noteState.content)
        .font(.subheadline)
    }
    .padding()
    .navigationTitle("Detalhes da Nota")
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button("Salvar") {
          note = noteState
          dismiss()
        }
        .disabled(note == noteState)
      }
    }
  }
}

#Preview {
  @State var note = Note(title: "Teste Title", content: "Teste Content")
  return NavigationView {
    NoteDetailView(note: $note)
  }
}
