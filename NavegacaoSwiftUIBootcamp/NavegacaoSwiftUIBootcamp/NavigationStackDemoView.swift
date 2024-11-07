//
//  NavigationStackDemoView.swift
//  NavegacaoSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct NavigationStackDemoView: View {

  @State var navigationPath: [String] = []


  var body: some View {
    NavigationStack(path: $navigationPath) {

      VStack {
        Button("Ir para a tela de detalhes") {
          navigationPath.append("Detalhes") // Adicionando "Detalhes" a pilha de navegação
        }

        Button("Ir para a tela de detalhes e para a tela de perfil") {
          navigationPath.append("Detalhes") // Adicionando "Detalhes" a pilha de navegação
          navigationPath.append("Profile")
        }
      }

      .navigationDestination(for: String.self) { view in
        if view == "Detalhes" {
          Tela02View()
        } else if view == "Profile" {
          Color.blue
        }
      }
    }
  }
}

#Preview {
  NavigationStackDemoView()
}
