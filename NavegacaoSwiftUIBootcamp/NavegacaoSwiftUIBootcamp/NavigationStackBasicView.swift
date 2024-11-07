//
//  NavigationStackBasicView.swift
//  NavegacaoSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct NavigationStackBasicView: View {

  @State var goNavigation: Bool = false

    var body: some View {
      NavigationStack {

        VStack(spacing: 20) {
          NavigationLink("Ir para a tela 02 com texto nativo", destination: {
            Tela02View()
          })

          NavigationLink(destination: Tela02View(), label: {
            Text("Ir para a tela 02 com texto customizável")
              .font(.headline)
              .foregroundStyle(Color.black)
          })

          Button("Tela 02 programaticamente") {
            goNavigation.toggle()
          }
        }
          .navigationBarTitle("Navegações")
          .navigationBarTitleDisplayMode(.large)
          .navigationDestination(isPresented: $goNavigation) {
            Tela02View()
          }
      }
    }
}

#Preview {
    NavigationStackBasicView()
}
