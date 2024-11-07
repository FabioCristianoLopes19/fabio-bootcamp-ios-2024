//
//  ContentView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct ListBasic: View {
  
  let names: [String] = ["Caio", "João", "Pedro"]
  
  var body: some View {
    List(names, id: \.self) { value in
      Text(value)
        .font(.headline)
    }
  }
}

#Preview {
  ListBasic()
}
