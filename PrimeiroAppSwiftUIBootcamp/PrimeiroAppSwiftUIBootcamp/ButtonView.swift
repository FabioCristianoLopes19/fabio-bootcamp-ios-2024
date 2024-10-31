//
//  ButtonView.swift
//  PrimeiroAppSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 21/10/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
      Button("Clique aqui") {

      }

      Button {
         // action
      } label: {
        Label("Primeiro App SwiftUI Bootcamp", systemImage: "book")
          .foregroundStyle(.black)
          .font(.footnote)
      }
    }
}

#Preview {
    ButtonView()
}
