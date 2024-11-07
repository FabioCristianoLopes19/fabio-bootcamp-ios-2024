//
//  ContentView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct ListMoveItem: View {

  @State var names: [String] = ["Caio", "João", "Pedro"]

  var body: some View {
    NavigationStack {
      List($names, id: \.self, editActions: .all) { $value in
        NavigationLink(value) {
          Text(value)
        }
      }
    }
  }
}

#Preview {
  ListMoveItem()
}
