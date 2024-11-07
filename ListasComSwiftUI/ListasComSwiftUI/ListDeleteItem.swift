//
//  ContentView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct ListDeleteItem: View {

  @State var names: [String] = ["Caio", "João", "Pedro"]

  var body: some View {
    List($names, id: \.self, editActions: .delete) { $value in
      Text(value)
        .deleteDisabled(value == "Caio")
        .font(.headline)
    }
  }
}

#Preview {
  ListDeleteItem()
}
