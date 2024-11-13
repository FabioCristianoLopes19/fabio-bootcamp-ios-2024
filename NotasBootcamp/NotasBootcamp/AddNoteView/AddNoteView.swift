//
//  AddNoteView.swift
//  NotasBootcamp
//
//  Created by Fabio Cristiano Lopes on 07/11/24.
//

import SwiftUI

struct AddNoteView: View {

  @State var note: Note = Note(title: "", content: "")
  @ObservedObject var viewModel: NoteViewModel
  @Environment(\.dismiss) var dismiss

  var body: some View {
    Form {
      Section {
        TextField("Informe o Título", text: $note.title)
      } header: {
        Text("Título")
      }

      Section {
        TextEditor(text: $note.content)
      } header: {
        Text("Conteúdo")
      }

      Section {
        Button("Salvar") {
          viewModel.notes.append(note)
          dismiss()
        }
        .disabled(note.content == "" || note.title == "")
      }
    }
  }
}

#Preview {
  var viewModel = NoteViewModel()
  return AddNoteView(viewModel: viewModel)
}
